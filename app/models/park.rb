class Park < ApplicationRecord
  has_many :hikes

  validates_presence_of :name, :location, :fee
  validates :national_park_pass, inclusion: [true, false]
end
