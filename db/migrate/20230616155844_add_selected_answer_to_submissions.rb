class AddSelectedAnswerToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :selected_answer, :integer
  end
end
