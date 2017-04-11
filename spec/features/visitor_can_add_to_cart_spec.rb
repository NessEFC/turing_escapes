require 'rails_helper'

RSpec.feature "As a visitor" do
  scenario "they can add escapes to the cart" do

    escape_1, escape_2 = create_list(:escape, 2)

    visit escape_path(escape_1)
    click_on "Book Escape"

    visit escape_path(escape_2)
    click_on "Book Escape"

    click_on "View Cart"

    expect(current_path).to eq "/cart"
    expect(page).to have_content(escape_2.name)
    expect(page).to have_content(escape_2.city)
    expect(page).to have_content(escape_2.description)
    expect(page).to have_content(escape_2.price)
    expect(page).to have_content("Total: $400.0")
  end
end
