require 'rails_helper'

RSpec.describe 'Park hikes index' do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { zion.hikes.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  it "show all of the attributes of the hikes for the park" do
    visit "/parks/#{zion.id}/hikes"

    expect(page).to have_content(hike_1.name)
    expect(page).to have_content(hike_1.length_miles)
    expect(page).to have_content(hike_1.open)

    expect(page).to have_content(hike_2.name)
    expect(page).to have_content(hike_2.length_miles)
    expect(page).to have_content(hike_2.open)
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

  it "can see a link at the top of the page that sorts all of a park's hikes in alphabethical order by name" do
    visit "/parks/#{zion.id}/hikes"

    click_on('Sort by Name')

    expect(current_path).to eq("/parks/#{zion.id}/hikes")
    expect(page.text.index("#{hike_1.name}")).to be < page.text.index("#{hike_2.name}")

  end
end
