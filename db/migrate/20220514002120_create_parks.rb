class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :location
      t.float :fee
      t.boolean :national_park_pass
    end
  end
end
