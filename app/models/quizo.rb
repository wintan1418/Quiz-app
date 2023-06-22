class Quizo < ApplicationRecord
    has_many :quesitions, dependent: :destroy
    accepts_nested_attributes_for :quesitions, reject_if: :all_blank, allow_destroy: true
    has_many :contestants, dependent: :destroy
    accepts_nested_attributes_for :contestants, reject_if: :all_blank, allow_destroy: true
    has_many :submissions, dependent: :destroy
    
    def correct_answer_text
      send("answer#{correct_answer}")
    end
  end
  