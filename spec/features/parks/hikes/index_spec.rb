require 'rails_helper'

RSpec.describe 'Park hikes index' do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { zion.hikes.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  it "show all of the attributes of the hikes for the park" do
    visit "/parks/#{zion.id}/hikes"
    # save_and_open_page

    expect(page).to have_content(hike_1.name)
    expect(page).to have_content(hike_1.length_miles)
    expect(page).to have_content(hike_1.open)
    expect(page).to have_content(hike_1.park_id)

    expect(page).to have_content(hike_2.name)
    expect(page).to have_content(hike_2.length_miles)
    expect(page).to have_content(hike_2.open)
    expect(page).to have_content(hike_2.park_id)
  end

  it "displays hikes index link that routes to the hikes index page" do
    visit '/parks'

    click_on('Hikes')
    expect(current_path).to eq('/hikes')
  end

  it "displays parks index link that routes to the parks index page" do
    visit '/hikes'

    click_on('National Parks')
    expect(current_path).to eq('/parks')
  end

#   User Story 10, Parent Child Index Link
#
# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
end
