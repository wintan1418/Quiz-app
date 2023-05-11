require "application_system_test_case"

class QuizosTest < ApplicationSystemTestCase
  setup do
    @quizo = quizos(:one)
  end

  test "visiting the index" do
    visit quizos_url
    assert_selector "h1", text: "Quizos"
  end

  test "should create quizo" do
    visit quizos_url
    click_on "New quizo"

    fill_in "Title", with: @quizo.title
    click_on "Create Quizo"

    assert_text "Quizo was successfully created"
    click_on "Back"
  end

  test "should update Quizo" do
    visit quizo_url(@quizo)
    click_on "Edit this quizo", match: :first

    fill_in "Title", with: @quizo.title
    click_on "Update Quizo"

    assert_text "Quizo was successfully updated"
    click_on "Back"
  end

  test "should destroy Quizo" do
    visit quizo_url(@quizo)
    click_on "Destroy this quizo", match: :first

    assert_text "Quizo was successfully destroyed"
  end
end
