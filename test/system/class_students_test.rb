require "application_system_test_case"

class ClassStudentsTest < ApplicationSystemTestCase
  setup do
    @class_student = class_students(:one)
  end

  test "visiting the index" do
    visit class_students_url
    assert_selector "h1", text: "Class Students"
  end

  test "creating a Class student" do
    visit class_students_url
    click_on "New Class Student"

    fill_in "Class", with: @class_student.class_id
    fill_in "Status", with: @class_student.status
    fill_in "User", with: @class_student.user_id
    click_on "Create Class student"

    assert_text "Class student was successfully created"
    click_on "Back"
  end

  test "updating a Class student" do
    visit class_students_url
    click_on "Edit", match: :first

    fill_in "Class", with: @class_student.class_id
    fill_in "Status", with: @class_student.status
    fill_in "User", with: @class_student.user_id
    click_on "Update Class student"

    assert_text "Class student was successfully updated"
    click_on "Back"
  end

  test "destroying a Class student" do
    visit class_students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Class student was successfully destroyed"
  end
end
