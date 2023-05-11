class CreateQuizos < ActiveRecord::Migration[7.0]
  def change
    create_table :quizos do |t|
      t.string :title

      t.timestamps
    end
  end
end
