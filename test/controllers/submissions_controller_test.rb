require "test_helper"

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get submissions_create_url
    assert_response :success
  end

  test "should get show" do
    get submissions_show_url
    assert_response :success
  end
end
