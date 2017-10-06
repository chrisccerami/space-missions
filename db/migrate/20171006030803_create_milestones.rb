class CreateMilestones < ActiveRecord::Migration[5.1]
  def change
    create_table :milestones do |t|
      t.integer :mission_id, null: false
      t.string :name
      t.text :description
      t.datetime :date

      t.timestamps
    end
    add_foreign_key :milestones, :missions
  end
end
