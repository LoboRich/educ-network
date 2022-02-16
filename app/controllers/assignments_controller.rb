class AssignmentsController < ApplicationController
  before_action :set_group 
  before_action :set_assignment, only: %i[ show edit update destroy ]


  # GET /assignments or /assignments.json
  def index
    @assignments = @group.assignments
  end

  # GET /assignments/1 or /assignments/1.json
  def show
    @assignment_submission = @assignment.assignment_submissions.build
    @assignment_submissions = @assignment.assignment_submissions
  end

  # GET /assignments/new
  def new
    authorize Assignment, :new?
    @assignment = @group.assignments.build
  end

  # GET /assignments/1/edit
  def edit
    authorize Assignment, :edit?
  end

  # POST /assignments or /assignments.json
  def create
    @assignment = @group.assignments.build(assignment_params)
    
    respond_to do |format|
      if @assignment.save
        format.html { redirect_to group_assignment_path(@group, @assignment), notice: "Assignment was successfully created." }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignments/1 or /assignments/1.json
  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to group_assignment_path(@group), notice: "Assignment was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1 or /assignments/1.json
  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to group_assignments_path(@group), notice: "Assignment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_group
      @group = Group.find(params[:group_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = @group.assignments.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
      params.require(:assignment).permit(:title, :instructions, :group_id)
    end
end
