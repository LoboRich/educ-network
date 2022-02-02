require "application_system_test_case"

class AssignmentSubmissionsTest < ApplicationSystemTestCase
  setup do
    @assignment_submission = assignment_submissions(:one)
  end

  test "visiting the index" do
    visit assignment_submissions_url
    assert_selector "h1", text: "Assignment Submissions"
  end

  test "creating a Assignment submission" do
    visit assignment_submissions_url
    click_on "New Assignment Submission"

    fill_in "Assignment", with: @assignment_submission.assignment_id
    fill_in "Body", with: @assignment_submission.body
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "User", with: @assignment_submission.user_id
    click_on "Create Assignment submission"

    assert_text "Assignment submission was successfully created"
    click_on "Back"
  end

  test "updating a Assignment submission" do
    visit assignment_submissions_url
    click_on "Edit", match: :first

    fill_in "Assignment", with: @assignment_submission.assignment_id
    fill_in "Body", with: @assignment_submission.body
    fill_in "Grade", with: @assignment_submission.grade
    fill_in "User", with: @assignment_submission.user_id
    click_on "Update Assignment submission"

    assert_text "Assignment submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Assignment submission" do
    visit assignment_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assignment submission was successfully destroyed"
  end
end
