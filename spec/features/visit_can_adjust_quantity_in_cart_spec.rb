require 'rails_helper'

RSpec.feature "As a visitor", do
  scenario "they can adjust quantity of cart escapes" do

    escape = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 200.00, city: "Denver", image: "image.url")

    expect(current_path).to eq "/cart"

    expect(page).to have_content("1")

    fill_in("quantity", with: 3)

    click_on "Update Cart"

    expect(current_path).to eq "/cart"

    expect(page).to have_content("3")

    expect(page).to have_content((3 * escape.price)

    fill_in("quantity", with: 2)

    click_on "Update Cart"

    expect(current_path).to eq('/cart')

    expect(page).to have_content("2")

    expect(page).to have_content(2 * escape.price)
  end
end
