require "application_system_test_case"

class QuesitionsTest < ApplicationSystemTestCase
  setup do
    @quesition = quesitions(:one)
  end

  test "visiting the index" do
    visit quesitions_url
    assert_selector "h1", text: "Quesitions"
  end

  test "should create quesition" do
    visit quesitions_url
    click_on "New quesition"

    fill_in "Answer1", with: @quesition.answer1
    fill_in "Answer2", with: @quesition.answer2
    fill_in "Answer3", with: @quesition.answer3
    fill_in "Answer4", with: @quesition.answer4
    fill_in "Content", with: @quesition.content
    fill_in "Correct answer", with: @quesition.correct_answer
    fill_in "Image", with: @quesition.image
    fill_in "Quizo", with: @quesition.quizo_id
    click_on "Create Quesition"

    assert_text "Quesition was successfully created"
    click_on "Back"
  end

  test "should update Quesition" do
    visit quesition_url(@quesition)
    click_on "Edit this quesition", match: :first

    fill_in "Answer1", with: @quesition.answer1
    fill_in "Answer2", with: @quesition.answer2
    fill_in "Answer3", with: @quesition.answer3
    fill_in "Answer4", with: @quesition.answer4
    fill_in "Content", with: @quesition.content
    fill_in "Correct answer", with: @quesition.correct_answer
    fill_in "Image", with: @quesition.image
    fill_in "Quizo", with: @quesition.quizo_id
    click_on "Update Quesition"

    assert_text "Quesition was successfully updated"
    click_on "Back"
  end

  test "should destroy Quesition" do
    visit quesition_url(@quesition)
    click_on "Destroy this quesition", match: :first

    assert_text "Quesition was successfully destroyed"
  end
end
