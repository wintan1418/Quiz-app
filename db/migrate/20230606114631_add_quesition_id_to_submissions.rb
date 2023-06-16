class AddQuesitionIdToSubmissions < ActiveRecord::Migration[7.0]
  def change
    add_reference :submissions, :quesition, foreign_key: true
  end
end
