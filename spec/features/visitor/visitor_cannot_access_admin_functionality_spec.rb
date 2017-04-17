require "rails_helper"


RSpec.feature "As a visitor" do 
  scenario "they cannot view admin dashboard" do

  visit admin_dashboard_path 

  expect(page).to have_content("The page you were looking for doesn't exist.")
  end 
end  
