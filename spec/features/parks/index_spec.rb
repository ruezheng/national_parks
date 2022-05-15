require 'rails_helper'

RSpec.describe "the parks index page", type: :feature do # TODO: Is this good formatting? Is it more important to have the attributes lied up or have no spaces after the create
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

  it "displays the names of all parks" do
    visit "/parks"
    # save_and_open_page

    expect(page).to have_content(zion.name)
    expect(page).to have_content(yellowstone.name)
    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(moab.name)
  end

  it "orders all parks by most recently created first and displays created_at timestamp next to name of each park" do
    visit "/parks"
    save_and_open_page
#
    expect(page).to have_content(zion.name)
    expect(page).to have_content(zion.created_at)
    expect(page).to have_content(yellowstone.name)
    expect(page).to have_content(yellowstone.created_at)
    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(yosemite.created_at)
    expect(page).to have_content(moab.name)
    expect(page).to have_content(moab.created_at)
  end
end
