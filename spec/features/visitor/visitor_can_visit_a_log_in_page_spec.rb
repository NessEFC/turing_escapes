require 'rails_helper'

RSpec.feature 'As a visitor' do
  scenario 'they can visit the log in page' do

    visit root_path

    click_on "Login"

    expect(current_path).to eq(login_path)

    expect(page).to have_field("Username")
    expect(page).to have_field("Password")

    expect(page).to have_button("Create Account")
  end
end