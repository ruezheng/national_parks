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
    expect(page).to have_content(hike_1.park_id)

    expect(page).to have_content(hike_2.name)
    expect(page).to have_content(hike_2.length_miles)
    expect(page).to have_content(hike_2.open)
    expect(page).to have_content(hike_2.park_id)
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

# User Story 13, Parent Child Creation
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

  describe 'When I visit the new hike form by clicking a link in the park hikes index'
    it "I can create a new hike for that park" do
      visit '/parks/:park_id/hikes'

      click_link('Create Hike')

      expect(current_path).to eq("/parks/:park_id/hikes/new")

      fill_in(:name, with: 'New test hike')
      fill_in(:length_miles, with: 'Montana')
      fill_in(:park_id, with: 'zion.id')
      fill_in(:open, with: 'true')

      click_on('Create Hike')

      expect(current_page).to eq('/parks/:park_id/hikes')
      expect(page).to have_content('New test hike')
      expect(page).to_not have_content('Glacier National Park')
    end
end
