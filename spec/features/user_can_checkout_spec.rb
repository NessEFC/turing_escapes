require 'rails_helper'

RSpec.feature "as a logged-in user" do
  scenario "they can checkout and order is placed" do
  user = create(:user)
  allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  escape_1, escape_2 = create_list(:escape, 2)

  visit escape_path(escape_1)

  click_on "Book Escape"

  visit escape_path(escape_2)

  click_on "Book Escape"

  visit cart_path

  click_on "Checkout"
  expect(current_path).to eq(orders_path)
  expect(page).to have_content("Order was successfully placed")
  expect(page).to have_content("Order #1")  
  end
end