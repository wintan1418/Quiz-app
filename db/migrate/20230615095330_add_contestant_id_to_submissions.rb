class AddContestantIdToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_column :submissions, :contestant_id, :integer
  end
end
