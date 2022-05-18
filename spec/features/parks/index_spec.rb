require 'rails_helper'

RSpec.describe "the parks index page" do
  
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00, created_at: 1.seconds.ago) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00, created_at: 50.seconds.ago) }
  let!(:yosemite) { Park.create!(name: 'Yosemite National Park', location: 'California', national_park_pass: false, fee: 15.00, created_at: 10.seconds.ago) }
  let!(:moab) { Park.create!(name: 'Moab National Park', location: 'Utah', national_park_pass: true, fee: 55.00, created_at: 2.seconds.ago) }


  it "displays the names of all parks" do
    visit "/parks"

    expect(page).to have_content(zion.name)
    expect(page).to have_content(yellowstone.name)
    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(moab.name)
  end

  it "orders all parks by most recently created first and displays created_at timestamp next to name of each park" do
    visit "/parks"

    expect(page).to have_content(zion.name)
    expect(page).to have_content(zion.created_at)
    expect(page).to have_content(yellowstone.name)
    expect(page).to have_content(yellowstone.created_at)
    expect(page).to have_content(yosemite.name)
    expect(page).to have_content(yosemite.created_at)
    expect(page).to have_content(moab.name)
    expect(page).to have_content(moab.created_at)
  end

  it "can see a link at the top of the page that takes me to the Park Index" do
    visit '/parks'

    click_on('Hikes')
    expect(current_path).to eq('/hikes')
  end

  it "can see a link at the top of the page that takes me to the Park Index" do
    visit '/hikes'

    click_on('National Parks')
    expect(current_path).to eq('/parks')
  end
end
