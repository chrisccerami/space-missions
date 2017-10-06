class Milestone < ApplicationRecord
  belongs_to :mission

  scope :future, -> { where.has { date > Time.now } }
end
