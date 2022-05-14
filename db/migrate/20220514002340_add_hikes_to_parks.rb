class AddHikesToParks < ActiveRecord::Migration[5.2]
  def change
    add_reference :parks, :parks, foreign_key: true
  end
end
