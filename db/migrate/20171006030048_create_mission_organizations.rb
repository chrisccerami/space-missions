class CreateMissionOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :mission_organizations do |t|
      t.integer :mission_id, null: false
      t.integer :organization_id, null: false
    end
    add_foreign_key :mission_organizations, :missions
    add_foreign_key :mission_organizations, :organizations
  end
end
