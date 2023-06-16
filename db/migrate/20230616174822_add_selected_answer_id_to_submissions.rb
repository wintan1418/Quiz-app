class AddSelectedAnswerIdToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :selected_answer_id, :integer
  end
end
