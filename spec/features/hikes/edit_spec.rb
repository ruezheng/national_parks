require 'rails_helper'

RSpec.describe "update hikes show page" do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { zion.hikes.create!(name: 'Hidden Canyon', length_miles: 3, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  it "can click on a link that takes me to an edit form to update a hike" do
    visit "/hikes/#{hike_1.id}"

    click_link("Update Hike")

    expect(current_path).to eq("/hikes/#{hike_1.id}/edit")
  end

  it "can update a hike's name and attributes" do
    visit "/hikes/#{hike_1.id}/edit"
    # save_and_open_page

    fill_in(:name, with: 'Updated Hike')
    fill_in(:length_miles, with: '1')
    fill_in(:open, with: 'true')

    click_on('Update Hike')

    expect(current_path).to eq("/hikes/#{hike_1.id}")
    expect(page).to have_content('Updated Hike')
    expect(page).to have_content('1')
    expect(page).to have_content('true')
    expect(page).to_not have_content('Hidden Canyon')
  end
end
