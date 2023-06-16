class AddAnswerIndexToContestantAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :contestant_answers, :answer_index, :integer
  end
end
