require 'rails_helper'

RSpec.describe Park do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00) }


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
end
