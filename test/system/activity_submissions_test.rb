require "application_system_test_case"

class ActivitySubmissionsTest < ApplicationSystemTestCase
  setup do
    @activity_submission = activity_submissions(:one)
  end

  test "visiting the index" do
    visit activity_submissions_url
    assert_selector "h1", text: "Activity Submissions"
  end

  test "creating a Activity submission" do
    visit activity_submissions_url
    click_on "New Activity Submission"

    click_on "Create Activity submission"

    assert_text "Activity submission was successfully created"
    click_on "Back"
  end

  test "updating a Activity submission" do
    visit activity_submissions_url
    click_on "Edit", match: :first

    click_on "Update Activity submission"

    assert_text "Activity submission was successfully updated"
    click_on "Back"
  end

  test "destroying a Activity submission" do
    visit activity_submissions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Activity submission was successfully destroyed"
  end
end
