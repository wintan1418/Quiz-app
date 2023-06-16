class AddSubmissionIdToContestantAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :contestant_answers, :submission, null: false, foreign_key: true
  end
end
