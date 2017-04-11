require 'rails_helper'

RSpec.feature "As a visitor" do
  scenario "they can remove escapes from the cart" do

    escape = Escape.create(name: "Cuba", description: "Communist Cuba!", price: 10.00, city: "Havana", image: "image.url")
    visit escape_path(escape)
    click_on "Book Escape"

    visit "/cart"

    expect(page).to have_content("Cuba")
    expect(page).to have_content("Havana")
    expect(page).to have_content("10.0")
    expect(page).to have_content("Communist Cuba!")

    expect(page).to have_content("Cart Total: $10.0")

    click_on "Remove Escape"

    expect(current_path).to eq "/cart"

    #something like this
    #How do you check color??
    expect(page).to have_content("Successfully removed #{escape.name} from your cart.")

    expect(page).to_not have_content("Havana")
    expect(page).to_not have_content("Communist Cuba!")
    expect(page).to_not have_content("10.0")
    expect(page).to_not have_content("Total: $210.0")

  end
end
