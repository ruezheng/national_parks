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

  xit "can see attributes of each park: name, location, national_park_pass, and fee" do
    visit "/parks/#{zion.id}"
    save_and_open_page

    expect(page).to have_content(zion.name)
    expect(page).to have_content("Location: #{zion.location}")
    expect(page).to have_content("National Park Pass Requirement: #{zion.national_park_pass}")
    expect(page).to have_content("Fee: #{zion.fee}")

    # expect(page).to have_content(yellowstone.name)
    # expect(page).to have_content("Location: #{yellowstone.location}")
    # expect(page).to have_content("National Park Pass Requirement: #{yellowstone.national_park_pass}")
    # expect(page).to have_content("Fee: #{yellowstone.fee}")
    #
    # expect(page).to have_content(yosemite.name)
    # expect(page).to have_content("Location: #{yosemite.location}")
    # expect(page).to have_content("National Park Pass Requirement: #{yosemite.national_park_pass}")
    # expect(page).to have_content("Fee: #{yosemite.fee}")


  end

  # OR
  #   it 'displays parks with their name, location, fee, and park pass requirement' do
  #     visit "/parks/:id"
  #     # open_and_save_page
  #
  #     expect(page).to have_content('Zion National Park')
  #     expect(page).to have_content('Utah')
  #     expect(page).to have_content(true)
  #     expect(page).to have_content('Yellowstone National Park')
  #     expect(page).to have_content('Wyoming')
  #     expect(page).to have_content(true)
  #     expect(page).to have_content('Yosemite National Park')
  #     expect(page).to have_content('California')
  #     expect(page).to have_content(false)
  #     expect(page).to_not have_content('Canyonlands')
  #
  #   end
  # end

end
