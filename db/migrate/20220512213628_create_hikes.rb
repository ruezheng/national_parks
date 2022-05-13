class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.float :length_miles
      t.boolean :open
      t.integer :park_id

      t.timestamps
    end
  end
end
