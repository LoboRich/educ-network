class AssignmentSubmissionsController < ApplicationController
  before_action :set_assignment_submission, only: %i[ show edit update destroy ]

  # GET /assignment_submissions or /assignment_submissions.json
  def index
    @assignment_submissions = AssignmentSubmission.all
  end

  # GET /assignment_submissions/1 or /assignment_submissions/1.json
  def show
  end

  # GET /assignment_submissions/new
  def new
    @assignment_submission = AssignmentSubmission.new
  end

  # GET /assignment_submissions/1/edit
  def edit
  end

  # POST /assignment_submissions or /assignment_submissions.json
  def create
    @assignment_submission = AssignmentSubmission.new(assignment_submission_params)

    respond_to do |format|
      if @assignment_submission.save
        format.html { redirect_to assignment_submission_url(@assignment_submission), notice: "Assignment submission was successfully created." }
        format.json { render :show, status: :created, location: @assignment_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_submissions/1 or /assignment_submissions/1.json
  def update
    respond_to do |format|
      if @assignment_submission.update(assignment_submission_params)
        format.html { redirect_to assignment_submission_url(@assignment_submission), notice: "Assignment submission was successfully updated." }
        format.json { render :show, status: :ok, location: @assignment_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assignment_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_submissions/1 or /assignment_submissions/1.json
  def destroy
    @assignment_submission.destroy

    respond_to do |format|
      format.html { redirect_to assignment_submissions_url, notice: "Assignment submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_submission
      @assignment_submission = AssignmentSubmission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_submission_params
      params.require(:assignment_submission).permit(:assignment_id, :user_id, :file, :body, :grade)
    end
end
