#  As a visitor when I have items in my cart
#     And when I visit "/cart"
#     I should not see an option to "Checkout"
#     I should see an option to "Login or Create Account to Checkout"
#     After I create an account
#     

require 'rails_helper'

RSpec.feature "A visitor has to log in to checkout" do
  scenario "when visitor visits the cart she has to log in to checkout " do
    escape = create(:escape)

    visit escapes_path
    click_on "Book Escape"
    
    visit cart_path

    expect(page).to_not have_content("Checkout")
    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Login or Create Account to Proceed")
   
    click_on "Login or Create Account to Proceed"

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "TheCraigness"
    fill_in "user[password]", with: "CraigPassword"
    fill_in "user[password_confirmation]", with: "CraigPassword"

    click_on "Submit"

    visit cart_path

    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content(escape.name)
    expect(page).to have_button("Checkout")
    expect(page).to have_content("Logout")
  end
end
