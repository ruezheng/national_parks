require 'rails_helper'

RSpec.describe 'new parks Hike creation' do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }

  describe 'When I visit the new hike form by clicking a link in the park hikes index' do
    it "I can create a new hike for that park" do # >>>>>>>>>> USER STORY 13, ERROR <<<<<<<<<<<<<<<<<<
      visit "/parks/#{zion.id}/hikes"

      click_link('Create Hike')

    expect(current_path).to eq("/parks/#{zion.id}/hikes/new")

      fill_in(:name, with: 'New test hike')
      fill_in(:length_miles, with: 'Montana')
      fill_in(:open, with: 'true')

      click_on('Create Hike')

      expect(current_path).to eq("/parks/#{zion.id}/hikes")
      expect(page).to have_content('New test hike')
      expect(page).to_not have_content('Glacier National Park')
    end
  end
end
