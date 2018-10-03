require 'rails_helper'

feature 'Non-signed-up Visitor' do
  before do 
    visit root_path
  end 

  scenario 'view all secrets' do 
    click_link 'All Secrets'
    expect(page).to have_content('Listing secrets'); 
  end
end