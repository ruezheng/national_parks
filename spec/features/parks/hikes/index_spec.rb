require 'rails_helper'

RSpec.describe 'Park hikes index' do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { zion.hikes.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  # User Story 5, Parent Children Index
  #
  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes:

  it "show all of the attributes of the hikes for the park" do
    visit '/parks/:park_id/hikes'
    # visit "/parks/#{zion.id}/hikes"
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
end
