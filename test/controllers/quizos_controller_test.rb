require "test_helper"

class QuizosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quizo = quizos(:one)
  end

  test "should get index" do
    get quizos_url
    assert_response :success
  end

  test "should get new" do
    get new_quizo_url
    assert_response :success
  end

  test "should create quizo" do
    assert_difference("Quizo.count") do
      post quizos_url, params: { quizo: { title: @quizo.title } }
    end

    assert_redirected_to quizo_url(Quizo.last)
  end

  test "should show quizo" do
    get quizo_url(@quizo)
    assert_response :success
  end

  test "should get edit" do
    get edit_quizo_url(@quizo)
    assert_response :success
  end

  test "should update quizo" do
    patch quizo_url(@quizo), params: { quizo: { title: @quizo.title } }
    assert_redirected_to quizo_url(@quizo)
  end

  test "should destroy quizo" do
    assert_difference("Quizo.count", -1) do
      delete quizo_url(@quizo)
    end

    assert_redirected_to quizos_url
  end
end
