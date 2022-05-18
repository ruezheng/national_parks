class Hike < ApplicationRecord
  belongs_to :park

  validates_presence_of :name, :length_miles, :park_id
  validates :open, inclusion: [true, false]

  def self.open_hikes # USER STORY 15
    where(open: 'true').to_a
  end
end
