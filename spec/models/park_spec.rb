require 'rails_helper'

RSpec.describe Park do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00, created_at: 1.seconds.ago) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00, created_at: 50.seconds.ago) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00, created_at: 10.seconds.ago) }
  let!(:moab) { Park.create!(name: 'Moab National Park', location: 'Utah', national_park_pass: true, fee: 55.00, created_at: 2.seconds.ago) }

  let!(:hike_1) { Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }
  let!(:hike_3) { Hike.create!(name: 'Upper Geysey Basin', length_miles: 4.9, park_id: yellowstone.id, open: false) }
  let!(:hike_4) { Hike.create!(name: 'Fairy Falls Trail', length_miles: 4.8, park_id: yellowstone.id, open: true) }
  let!(:hike_5) { Hike.create!(name: 'Half Dome', length_miles: 16, park_id: yosemite.id, open: true) }
  let!(:hike_6) { Hike.create!(name: 'Yosemite Falls', length_miles: 7.2, park_id: yosemite.id, open: true) }
  let!(:hike_7) {Hike.create!(name: 'Mesa Arch Trail', length_miles: 0.7, park_id: moab.id, open: true) }
  let!(:hike_8) {Hike.create!(name: 'Dead Horse Rim Loop', length_miles: 5.0, park_id: moab.id, open: true) }

  describe 'relationships' do
    it { should have_many :hikes }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :fee }
    it { should allow_value(true).for(:national_park_pass) }
    it { should allow_value(false).for(:national_park_pass) }
  end

  describe '.order_by_time_created' do
    it 'displays parks ordered by most recently created first' do
      expect(Park.order_by_time_created.to_a).to eq [zion, moab, yosemite, yellowstone]
    end
  end

  describe '#count_hikes' do
    it 'can see a count of the number of hikes associated with the park' do
      expect(zion.count_hikes).to eq(2)
    end
  end
end
