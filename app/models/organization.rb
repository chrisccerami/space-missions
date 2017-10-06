class Organization < ApplicationRecord
  has_many :mission_organizations
  has_many :missions, through: :mission_organizations
end
