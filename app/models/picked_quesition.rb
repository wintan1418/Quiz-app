class PickedQuesition < ApplicationRecord
  belongs_to :contestant
  belongs_to :quesition
end
