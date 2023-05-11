class Quesition < ApplicationRecord
  belongs_to :quizo
  validates :correct_answer, inclusion: {in: 1..4}

  has_one_attached :image
end
