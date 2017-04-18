require 'rails_helper'

RSpec.feature 'As a visitor' do
  scenario 'they can create a new account' do

    visit login_path

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "TheCraigness"
    fill_in "user[password]", with: "CraigPassword"
    fill_in "user[password_confirmation]", with: "CraigPassword"

    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as TheCraigness")
    expect(page).to have_content("Welcome TheCraigness")
    expect(page).to have_content("Logout")

    expect(page).to_not have_content("Login")
  end
end