require 'rails_helper'

RSpec.feature "As a visitor" do
  scenario "they can add escapes to the cart" do

    escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 200.00, city: "Denver", image: "image.url")
    escape_2 = Escape.create(name: "Cuba", description: "Communist Cuba!", price: 10.00, city: "Havana", image: "image.url")

    visit escape_path(escape_1)

    click_on "Book Escape"

    visit escape_path(escape_2)

    click_on "Book Escape"
    visit escape_path(escape_2)

    click_on "View Cart"


    expect(current_path).to eq "/cart"

    expect(page).to have_content("Cuba")
    expect(page).to have_content("Havana")
    expect(page).to have_content("Communist Cuba!")
    expect(page).to have_content("10.0")
    expect(page).to have_content("Total: $210.0")

  end
end
