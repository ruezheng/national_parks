class Hike < ApplicationRecord
  belongs_to :park

  validates_presence_of :name, :length_miles, :park_id
  validates :open, inclusion: [true, false]

  # def self.open_hikes
  #   where(open: 'true')
  # end

  def self.sort
    order(:name)
  end
end
