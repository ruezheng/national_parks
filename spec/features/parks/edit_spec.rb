require 'rails_helper'

RSpec.describe "update parks show page" do
  let!(:zion) { Park.create!(name: 'Zion National Park', location: 'Utah', national_park_pass: true, fee: 20.00) }

  it "can see a link to update park" do
    visit "/parks/#{zion.id}"

    click_link("Update Park")

    expect(current_path).to eq("/parks/#{zion.id}/edit")
  end

  it "can update a park" do
    visit "/parks/#{zion.id}/edit"

    fill_in(:name, with: 'Updated National Park')
    fill_in(:location, with: 'New York')
    fill_in(:national_park_pass, with: 'false')
    fill_in(:fee, with: '45')

    click_on('Update Park')

    expect(current_path).to eq("/parks/#{zion.id}")
    expect(page).to have_content('Updated National Park')
    expect(page).to have_content('New York')
    expect(page).to have_content('false')
    expect(page).to have_content('45')
    expect(page).to_not have_content('Zion National Park')
  end
end
