class Contestant < ApplicationRecord
    belongs_to :quizo
    has_many :picked_quesitions, dependent: :destroy
    has_many :contestant_answers
    has_many :submissions

    attribute :score, default: 0
end
