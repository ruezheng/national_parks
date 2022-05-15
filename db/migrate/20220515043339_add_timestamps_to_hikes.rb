class AddTimestampsToHikes < ActiveRecord::Migration[5.2]
  def change
    add_column :hikes, :created_at, :datetime
    add_column :hikes, :updated_at, :datetime
  end
end
