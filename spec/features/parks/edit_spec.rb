# User Story 12, Parent Update

# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info %>

require 'rails_helper'

RSpec.describe "update parks show page" do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }

  it "can see link to update park" do
    visit "/parks/#{zion.id}"
    save_and_open_page

    click_link "Update #{park.name}"

    expect(current_path).to eq("/parks/#{park.id}/edit")
  end

  it "can update park" do

    visit "/parks/"

    fill_in(:name, with: 'Updated National Park')
    fill_in(:location, with: 'New York')
    fill_in(:national_park_pass, with: 'false')
    fill_in(:fee, with: '45')

    click_on('Update Park')

    expect(current_path).to eq("/parks/#{zion.id}")
    exepct(page).to have_content('Updated National Park')
    exepct(page).to_not have_content('Zion National Park')
  end
end
