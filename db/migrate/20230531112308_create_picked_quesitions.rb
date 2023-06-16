class CreatePickedQuesitions < ActiveRecord::Migration[7.0]
  def change
    create_table :picked_quesitions do |t|
      t.references :contestant, null: false, foreign_key: true
      t.references :quesition, null: false, foreign_key: true

      t.timestamps
    end
  end
end
