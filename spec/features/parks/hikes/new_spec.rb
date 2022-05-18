require 'rails_helper'

RSpec.describe 'New Hike' do
  describe 'When I visit the new hike form by clicking a link in the park hikes index'
    it "I can create a new hike for that park" do
      visit "/parks/#{zion.id}/hikes"

      click_link('Create Hike')

      expect(current_path).to eq("/parks/#{zion.id}/hikes/new")
      fill_in(:name, with: 'New test hike')
      fill_in(:length_miles, with: 'Montana')
      fill_in(:park_id, with: 'zion.id')
      fill_in(:open, with: 'true')

      click_on('Create Hike')

      expect(current_page).to eq("/parks/#{zion.id}/hikes")
      expect(page).to have_content('New test hike')
      expect(page).to_not have_content('Glacier National Park')
    end
  end
end
