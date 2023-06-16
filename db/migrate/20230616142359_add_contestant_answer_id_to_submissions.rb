class AddContestantAnswerIdToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :submissions, :contestant_answer, foreign_key: true
  end
  
end
