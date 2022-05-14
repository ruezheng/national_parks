class CreateHikes < ActiveRecord::Migration[5.2]
  def change
    create_table :hikes do |t|
      t.string :name
      t.float :length_miles
      t.boolean :open
    end
  end
end
