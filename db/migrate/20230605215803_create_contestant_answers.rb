class CreateContestantAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :contestant_answers do |t|
      t.references :contestant, null: false, foreign_key: true
      t.references :quesition, null: false, foreign_key: true
      t.integer :answer

      t.timestamps
    end
  end
end
