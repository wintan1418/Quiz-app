class AddQuizoToContestants < ActiveRecord::Migration[7.0]
  def change
    add_reference :contestants, :quizo, null: false, foreign_key: true
  end
end
