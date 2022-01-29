require 'test_helper'

class ClassStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_student = class_students(:one)
  end

  test "should get index" do
    get class_students_url
    assert_response :success
  end

  test "should get new" do
    get new_class_student_url
    assert_response :success
  end

  test "should create class_student" do
    assert_difference('ClassStudent.count') do
      post class_students_url, params: { class_student: { class_id: @class_student.class_id, status: @class_student.status, user_id: @class_student.user_id } }
    end

    assert_redirected_to class_student_url(ClassStudent.last)
  end

  test "should show class_student" do
    get class_student_url(@class_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_student_url(@class_student)
    assert_response :success
  end

  test "should update class_student" do
    patch class_student_url(@class_student), params: { class_student: { class_id: @class_student.class_id, status: @class_student.status, user_id: @class_student.user_id } }
    assert_redirected_to class_student_url(@class_student)
  end

  test "should destroy class_student" do
    assert_difference('ClassStudent.count', -1) do
      delete class_student_url(@class_student)
    end

    assert_redirected_to class_students_url
  end
end
