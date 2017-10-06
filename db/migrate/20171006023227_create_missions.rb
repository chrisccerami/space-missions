class CreateMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :missions do |t|
      t.string :name
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
