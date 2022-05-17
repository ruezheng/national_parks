require 'rails_helper'

RSpec.describe 'the parks show page' do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00) }

  let!(:hike_1) { Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }
  let!(:hike_3) { Hike.create!(name: 'Upper Geysey Basin', length_miles: 4.9, park_id: yellowstone.id, open: false) }
  let!(:hike_4) { Hike.create!(name: 'Fairy Falls Trail', length_miles: 4.8, park_id: yellowstone.id, open: true) }
  let!(:hike_5) { Hike.create!(name: 'Half Dome', length_miles: 16, park_id: yosemite.id, open: true) }
  let!(:hike_6) { Hike.create!(name: 'Yosemite Falls', length_miles: 7.2, park_id: yosemite.id, open: true) }

  it "can see all attributes of each park: name, location, national_park_pass, and fee" do
    visit "/parks/#{zion.id}"
    # save_and_open_page

    expect(page).to have_content(zion.name)
    expect(page).to have_content("Location: #{zion.location}")
    expect(page).to have_content("National Park Pass Required: #{zion.national_park_pass}")
    expect(page).to have_content("Fee: #{zion.fee}")

    expect(page).to_not have_content(yellowstone.name)
    expect(page).to_not have_content("Location: #{yellowstone.location}")
    expect(page).to_not have_content("National Park Pass Requirement: #{yellowstone.national_park_pass}")
    expect(page).to_not have_content("Fee: #{yellowstone.fee}")
  end

  it 'can see a count of the number of hikes associated with the park' do
    visit "/parks/#{zion.id}"
    # save_and_open_page

    expect(page).to have_content(zion.count_hikes)
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

  it "can see a link to take me to that park's 'hikes' page " do
    visit "/parks/#{zion.id}"

    click_on('Find a Hike')
    expect(current_path).to eq("/parks/#{zion.id}/hikes")
  end
end
