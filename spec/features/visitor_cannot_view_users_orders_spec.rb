require 'rails_helper'

RSpec.feature 'As a visitor' do 
  scenario 'they cannot view another users past orders' do 
    
    visit orders_path 

    expect(page).to have_content("Log in to view past orders")

  end   
end 