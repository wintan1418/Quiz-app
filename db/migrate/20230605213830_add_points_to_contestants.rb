class AddPointsToContestants < ActiveRecord::Migration[7.0]
  def change
    add_column :contestants, :points, :integer
  end
end
