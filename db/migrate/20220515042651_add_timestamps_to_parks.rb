class AddTimestampsToParks < ActiveRecord::Migration[5.2]
  def change
    add_column :parks, :created_at, :datetime
    add_column :parks, :updated_at, :datetime
  end
end
