require 'rails_helper'

RSpec.describe "destroying a Park" do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { zion.hikes.create!(name: 'Hidden Canyon', length_miles: 3, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  it "can click on a button that deletes that hike" do
    visit "/hikes/#{hike_1.id}"
    click_on 'Delete Hike'

    expect(current_path).to eq("/hikes")
    expect(page).to_not have_content('Hidden Canyon')
    expect(page).to have_content('Angels Landing')
  end
end
