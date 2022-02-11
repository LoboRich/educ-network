class ActivitySubmissionsController < ApplicationController
  before_action :set_activity_submission, only: %i[ show edit update destroy ]

  # GET /activity_submissions or /activity_submissions.json
  def index
    @activity_submissions = ActivitySubmission.all
  end

  # GET /activity_submissions/1 or /activity_submissions/1.json
  def show
  end

  # GET /activity_submissions/new
  def new
    @activity_submission = ActivitySubmission.new
  end

  # GET /activity_submissions/1/edit
  def edit
  end

  # POST /activity_submissions or /activity_submissions.json
  def create
    @activity_submission = ActivitySubmission.new(activity_submission_params)

    respond_to do |format|
      if @activity_submission.save
        format.html { redirect_to activity_submission_url(@activity_submission), notice: "Activity submission was successfully created." }
        format.json { render :show, status: :created, location: @activity_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_submissions/1 or /activity_submissions/1.json
  def update
    respond_to do |format|
      if @activity_submission.update(activity_submission_params)
        format.html { redirect_to activity_submission_url(@activity_submission), notice: "Activity submission was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_submissions/1 or /activity_submissions/1.json
  def destroy
    @activity_submission.destroy

    respond_to do |format|
      format.html { redirect_to activity_submissions_url, notice: "Activity submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_submission
      @activity_submission = ActivitySubmission.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_submission_params
      params.fetch(:activity_submission, {})
    end
end
