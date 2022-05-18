require 'rails_helper'

RSpec.describe 'the hikes show page' do
  
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00) }

  let!(:hike_1) { Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }
  let!(:hike_3) { Hike.create!(name: 'Upper Geysey Basin', length_miles: 4.9, park_id: yellowstone.id, open: false) }
  let!(:hike_4) { Hike.create!(name: 'Fairy Falls Trail', length_miles: 4.8, park_id: yellowstone.id, open: true) }
  let!(:hike_5) { Hike.create!(name: 'Half Dome', length_miles: 16, park_id: yosemite.id, open: true) }
  let!(:hike_6) { Hike.create!(name: 'Yosemite Falls', length_miles: 7.2, park_id: yosemite.id, open: true) }

  it "displays all attributes of hike_1: name, length_miles, open:, and park_id" do
    visit "/hikes/#{hike_1.id}"

    expect(page).to have_content(hike_1.name)
    expect(page).to have_content(hike_1.length_miles)
    expect(page).to have_content(hike_1.open)
    expect(page).to have_content(hike_1.park_id)

    expect(page).to_not have_content(hike_3.name)
    expect(page).to_not have_content(hike_3.length_miles)
    expect(page).to_not have_content(hike_3.open)
    expect(page).to_not have_content(hike_3.park_id)
  end

  it "can see a link at the top of the page that takes me to the Park Index" do
    visit '/parks'

    click_on('Explore Hikes')
    expect(current_path).to eq('/hikes')
  end

  it "can see a link at the top of the page that takes me to the Park Index" do
    visit '/hikes'

    click_on('Explore National Parks')
    expect(current_path).to eq('/parks')
  end
end
