class Park < ApplicationRecord
  has_many :hikes, dependent: :destroy
3
  validates_presence_of :name, :location, :fee
  validates :national_park_pass, inclusion: [true, false]

  def self.order_by_time_created
    order('created_at desc')
  end

end
