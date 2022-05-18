require 'rails_helper'

RSpec.describe 'new Park creation' do

  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }
  let!(:hike_1) { Hike.create!(name: 'Hidden Canyon', length_miles: 3, park_id: zion.id, open: true) }
  let!(:hike_2) { Hike.create!(name: 'Angels Landing', length_miles: 5.4, park_id: zion.id, open: true) }

  describe 'When I visit the new hike form by clicking a link on the park hike index' do
    it 'I can create a new hike in a park' do
      visit "/parks"

      click_on 'New Park'

      expect(current_path).to eq('/parks/new')

      fill_in(:name, with: 'Glacier National Park')
      fill_in(:location, with: 'Montana')
      fill_in(:national_park_pass, with: 'true')
      fill_in(:fee, with: '20')

      click_on('Create Park')

      expect(current_path).to eq('/parks')
      expect(page).to have_content('Glacier National Park')
      expect(page).to_not have_content('test')
    end
  end
end
