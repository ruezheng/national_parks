require 'rails_helper'

RSpec.describe 'the parks show page' do
  zion = Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true)
  yellowstone = Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true)
  yosemite = Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false)
  # let:(zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true) }
  # let:(yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true) }
  # let:(yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: true) }

  # [ ] done
  #
  # User Story 1, Parent Index
  #
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

open_and_save_page

  it 'lists parks with their name, location, and park pass requirement' do
    visit '/parks'

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
