class Submission < ApplicationRecord
  belongs_to :quizo 
  belongs_to :quesition
  belongs_to :contestant

  attribute :selected_answer_id, :integer
end
