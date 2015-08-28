require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe 'music_finder path', { type: :feature } do
  it 'can create a band' do
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
end
