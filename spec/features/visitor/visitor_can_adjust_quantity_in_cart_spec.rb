require 'rails_helper'

RSpec.feature "As a visitor" do
  scenario "they can increase quantity of cart escapes" do
    escape_1 = create(:escape)

    visit escapes_path
    click_on "Book Escape"
    visit cart_path
    expect(page).to have_content("Quantity: 1")

    visit escape_path(escape_1)

    click_on "Book Escape"
    visit cart_path
    
    expect(current_path).to eq "/cart"
    expect(page).to have_content("Quantity: 2")
    expect(page).to have_content("Subtotal: $#{escape_1.price * 2}")
    expect(page).to have_content("Cart Total: $400.00")
  end

  scenario "they can decrease quantity of cart escapes" do
    escape_1 = create(:escape)

    visit escapes_path

    click_on "Book Escape"

    visit cart_path
    expect(page).to have_content("Quantity: 1")

    visit escape_path(escape_1)

    click_on "Book Escape"

    visit cart_path

    click_on "Decrease Quantity"

    expect(page).to have_content("Quantity: 1")
    expect(page).to have_content("Subtotal: $#{escape_1.price}")
    expect(page).to have_content("Cart Total: $200.00")
   end

   scenario "they can increase quantity of cart escapes" do
     escape_1 = create(:escape)

     visit escapes_path

     click_on "Book Escape"

     visit cart_path
     expect(page).to have_content("Quantity: 1")

     click_on "Increase Quantity"

     expect(page).to have_content("Quantity: 2")
     expect(page).to have_content("Subtotal: $#{escape_1.price * 2}")
     expect(page).to have_content("Cart Total: $400.00")
    end
  end
