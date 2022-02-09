require 'test_helper'

class ClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classes_index_url
    assert_response :success
  end

end
