require 'rails_helper'

RSpec.describe 'the parks show page' do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00) }

  let!(:hike1) { Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }
  let!(:hike3) { Hike.create!(name: 'Upper Geysey Basin', length_miles: 4.9, park_id: yellowstone.id, open: false) }
  let!(:hike4) { Hike.create!(name: 'Fairy Falls Trail', length_miles: 4.8, park_id: yellowstone.id, open: true) }
  let!(:hike5) { Hike.create!(name: 'Half Dome', length_miles: 16, park_id: yosemite.id, open: true) }
  let!(:hike6) { Hike.create!(name: 'Yosemite Falls', length_miles: 7.2, park_id: yosemite.id, open: true) }

  # [ ] done
  #
  # User Story 1, Parent Index
  #
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

# open_and_save_page

  it 'displays parks with their name, location, fee, and park pass requirement' do
    visit '/parks'
    # visit '/parks/#{park.id}'


    expect(page).to have_content('Zion National Park')
    expect(page).to have_content('Utah')
    expect(page).to have_content(true)
    expect(page).to have_content('Yellowstone National Park')
    expect(page).to have_content('Wyoming')
    expect(page).to have_content(true)
    expect(page).to have_content('Yosemite National Park')
    expect(page).to have_content('California')
    expect(page).to have_content(false)
    expect(page).to_not have_content('Canyonlands')

  end
end
