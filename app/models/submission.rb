class Submission < ApplicationRecord
  belongs_to :user
  belongs_to :quizo

  after_initialize :init

  def init
    self.user_answers ||= ()
  end
end
