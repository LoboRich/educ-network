require 'test_helper'

class ActivitySubmissionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_submission = activity_submissions(:one)
  end

  test "should get index" do
    get activity_submissions_url
    assert_response :success
  end

  test "should get new" do
    get new_activity_submission_url
    assert_response :success
  end

  test "should create activity_submission" do
    assert_difference('ActivitySubmission.count') do
      post activity_submissions_url, params: { activity_submission: {  } }
    end

    assert_redirected_to activity_submission_url(ActivitySubmission.last)
  end

  test "should show activity_submission" do
    get activity_submission_url(@activity_submission)
    assert_response :success
  end

  test "should get edit" do
    get edit_activity_submission_url(@activity_submission)
    assert_response :success
  end

  test "should update activity_submission" do
    patch activity_submission_url(@activity_submission), params: { activity_submission: {  } }
    assert_redirected_to activity_submission_url(@activity_submission)
  end

  test "should destroy activity_submission" do
    assert_difference('ActivitySubmission.count', -1) do
      delete activity_submission_url(@activity_submission)
    end

    assert_redirected_to activity_submissions_url
  end
end
