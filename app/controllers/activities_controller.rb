class ActivitiesController < ApplicationController
  before_action :set_group, only: %i[ index show new create ]
  before_action :set_activity, only: %i[ show edit update destroy ]

  # GET /activities or /activities.json
  def index
    @activities = @group.activities
  end

  # GET /activities/1 or /activities/1.json
  def show
    @questions = @activity.questions
    @count = @questions.count
    @points = @questions.sum(:grading)
    @submission = @activity.activity_submissions.where(user_id: current_user.id).first
    @score = @submission != nil ? @submission.answers.sum(:grading) : 0
    @students = @group.class_students
  end

  # GET /activities/new
  def new
    @activity = @group.activities.build
    5.times { @activity.questions.build }
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = @group.activities.build(activity_params)

    respond_to do |format|
      if @activity.save
        @post = @group.posts.new(content: "Created a new activity " + @activity.title, user_id: current_user.id)
        @post.save
        format.html { redirect_to group_path(@group), notice: "#{@activity.title} was successfully created." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:group_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = @group.activities.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:title, :instructions, questions_attributes: [:id, :query_question, :correct_answer, :grading])
    end
end
