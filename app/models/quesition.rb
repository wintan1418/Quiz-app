class Quesition < ApplicationRecord
  belongs_to :quizo
  validates :correct_answer, inclusion: {in: 1..4}
  has_many :contestant_answers
  has_one_attached :image
  has_many :submissions

  def available?
    ContestantAnswer.where(quesition_id: id).count.zero?
  end
end
