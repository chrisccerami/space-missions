class MissionOrganization < ApplicationRecord
  belongs_to :mission
  belongs_to :organization
end
