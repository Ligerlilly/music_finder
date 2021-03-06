require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'music_finder path', { type: :feature } do
  it 'can create a band only if name field is filled in' do
    visit '/'
    click_link 'Bands'
    click_link "Add Band"
    fill_in 'name', with: 'Nas'
    click_button 'Submit'
    expect(page).to have_content 'Nas'
  end

  it 'can update a band' do
    band = Band.create({ name: 'Nas' })
    visit "/bands"
    click_link "#{band.name}"
    click_link 'Update Band'
    fill_in 'name', with: 'Rage'
    click_button 'Submit'
    expect(page).to have_content 'Rage'
  end

  it 'can delete a band' do
    band = Band.create({ name: 'Nas' })
    visit "/bands/#{band.id}"
    click_link 'Update Band'
    click_button 'Delete'
    expect(page).not_to have_content 'Nas'
  end

  it 'can create a venue' do
    visit '/'
    click_link 'Venues'
    click_link "Add Venue"
    fill_in 'name', with: 'Moda Center'
    click_button 'Submit'
    expect(page).to have_content 'Moda Center'
  end

  it 'can add a venue to a band' do
    band = Band.create({ name: 'Nas' })
    venue = Venue.create({ name: 'Moda Center' })
    visit "/bands/#{band.id}"
    click_link 'Add a Venue to a Band'
    select 'Moda Center', from: 'venue_id'
    click_button 'Submit'
    expect(page).to have_content 'Nas'
    expect(page).to have_content 'Moda Center'
  end
end
