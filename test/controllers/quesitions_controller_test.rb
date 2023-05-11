require "test_helper"

class QuesitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quesition = quesitions(:one)
  end

  test "should get index" do
    get quesitions_url
    assert_response :success
  end

  test "should get new" do
    get new_quesition_url
    assert_response :success
  end

  test "should create quesition" do
    assert_difference("Quesition.count") do
      post quesitions_url, params: { quesition: { answer1: @quesition.answer1, answer2: @quesition.answer2, answer3: @quesition.answer3, answer4: @quesition.answer4, content: @quesition.content, correct_answer: @quesition.correct_answer, image: @quesition.image, quizo_id: @quesition.quizo_id } }
    end

    assert_redirected_to quesition_url(Quesition.last)
  end

  test "should show quesition" do
    get quesition_url(@quesition)
    assert_response :success
  end

  test "should get edit" do
    get edit_quesition_url(@quesition)
    assert_response :success
  end

  test "should update quesition" do
    patch quesition_url(@quesition), params: { quesition: { answer1: @quesition.answer1, answer2: @quesition.answer2, answer3: @quesition.answer3, answer4: @quesition.answer4, content: @quesition.content, correct_answer: @quesition.correct_answer, image: @quesition.image, quizo_id: @quesition.quizo_id } }
    assert_redirected_to quesition_url(@quesition)
  end

  test "should destroy quesition" do
    assert_difference("Quesition.count", -1) do
      delete quesition_url(@quesition)
    end

    assert_redirected_to quesitions_url
  end
end
