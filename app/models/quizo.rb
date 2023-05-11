class Quizo < ApplicationRecord
    has_many :quesitions, dependent: :destroy
    accepts_nested_attributes_for :quesitions, reject_if: :all_blank, allow_destroy: true

    def correct_answer_text
        send("answer#{correct_answer}")
    end
end
