class GroupsController < ApplicationController
  before_action :set_group, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # GET /groups or /groups.json
  def index
    @groups = Group.all
  end

  # GET /groups/1 or /groups/1.json
  def show
    @class_student = @group.class_students.build
    @class_students = @group.class_students.where.not(id: nil)
    @students = User.where(role: 'student').collect{ |u| [u.fullname, u.id]}
  end

  # GET /groups/new
  def new
    authorize Group, :new?
    @group = Group.new
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups or /groups.json
  def create
    @group = Group.new(group_params)
    @class_student = @group.class_students.build(category_params)
		@group.class_students << @class_student

    respond_to do |format|
      if @group.save
        @group.update(code: rand(36**20).to_s(36))
        UserMailer.with(user: current_user, group: @group).welcome_email.deliver_now
        format.html { redirect_to profile_path, notice: "Group was successfully created." }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to group_url(@group), notice: "Group was successfully updated." }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: "Group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_student
    params.permit!
    begin
      student = ClassStudent.create(group_id: @group, user_id: params[:user], status: 'pending')
      UserMailer.with(student: student, group: @group).send_invitation.deliver_now
    rescue StandardError => e
      redirect_to group_url(@group), notice: "#{e.to_s}"
    end
  end

  def send_invite
    
  end

  def accept_invite
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:img, :user_id, :name, :description, :code)
    end
end
