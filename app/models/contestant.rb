class Contestant < ApplicationRecord
    belongs_to :quizo
    has_many :picked_quesitions, dependent: :destroy
end
