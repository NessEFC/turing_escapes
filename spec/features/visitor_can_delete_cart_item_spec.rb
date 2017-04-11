require 'rails_helper'

RSpec.feature "As a visitor" do
  scenario "they can remove escapes from the cart" do

    escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 200.00, city: "Denver", image: "image.url")
    escape_2 = Escape.create(name: "Cuba", description: "Communist Cuba!", price: 10.00, city: "Havana", image: "image.url")

    expect(current_path).to eq "/cart"

    expect(page).to have_content("Cuba")
    expect(page).to have_content("Havana")
    expect(page).to have_content("Communist Cuba!")
    expect(page).to have_content("10.0")
    expect(page).to have_content("Total: $210.0")

    click_on "Remove"

    expect(current_path).to eq "/cart"

    #something like this
    #How do you check color??
    # expect(flash[:success]).to match(/Successfully removed #{escape_1.name} from your cart.*/)

    expect(page).to_not have_content("Havana")
    expect(page).to_not have_content("Communist Cuba!")
    expect(page).to_not have_content("10.0")
    expect(page).to_not have_content("Total: $210.0")

    expect(page).to have_content("Gentle Dawn")

    expect(page).to have_link("#{escape_2.name}", href: 'escapes_path(escape_2)')

  end
end
