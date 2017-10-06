class Mission < ApplicationRecord
  has_many :mission_organizations
  has_many :organizations, through: :mission_organizations

  has_many :milestones

  def next_milestone
    milestones.future.order(date: :asc).first
  end
end
