require 'rails_helper'

RSpec.describe 'New Park' do
  describe 'When I visit the new park form by clicking a link on the index' do
    it 'I can create a new national park' do
      visit '/parks'

      click_link 'New Park'

      expect(current_path).to eq('/parks/new')

      fill_in(:name, with: 'Glacier National Park')
      fill_in(:location, with: 'Montana')
      fill_in(:national_park_pass, with: 'true')
      fill_in(:fee, with: '20')

      click_on('Create Park')

      expect(current_path).to eq('/parks')
      expect(page).to have_content('Glacier National Park')
      expect(page).to_not have_content('Not a park')
    end
  end
end
