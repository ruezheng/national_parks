require 'rails_helper'

RSpec.describe 'New Park' do
  describe 'When I visit the new park form by clicking a link on the index' do
    it 'I can create a new national park' do
      visit '/parks'

      click_link 'New National Park'

      expect(current_path).to eq('/parks/new')

      fill_in 'Name', with: 'Glacier National Park'
      fill_in 'Location', with: 'Montana'
      fill_in 'National Park Pass', with: 'true'
      fill_in 'Fee', with: '20'
      click_on 'Create National Park'

      expect(current_path).to eq('/parks')
      expect(page).to have_content('Glacier National Park')
    end
  end
end
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
