require 'rails_helper'

RSpec.describe "destroying a Park" do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:yellowstone) { Park.create!(name: 'Yellowstone National Park', location: 'Wyoming', national_park_pass: true, fee: 35.00) }

  it "can click on a button that deletes that park" do
    visit "/parks/#{zion.id}"
    click_on 'Delete Park'

    expect(current_path).to eq("/parks")
    expect(page).to_not have_content('Zion National Park')
    expect(page).to have_content('Yellowstone National Park')
  end
end
