require 'rails_helper'

RSpec.feature "As a logged-in user," do
  scenario "they can view a single order's show page" do

    user = create(:user)
    order = user.orders.create(status: "completed")
    escape = user.orders.first.escapes.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 500.00, city: "San Diago", image: "url")
    quantity = 1
    total = "500.00"

    visit login_path

    fill_in "session[username]", with: "TheUkrainian"
    fill_in "session[password]", with: "asecretpassword"
    click_on "Log In"

    visit orders_path

    expect(page).to have_content("Order #1")
    expect(page).to have_content("April 13, 2017")

    click_on("View Order")

    expect(current_path).to eq(order_path(order))
    expect(page).to have_content(escape.name)
    expect(page).to have_content(quantity) # Will implement this feature with checkout button functionality
    expect(page).to have_link("Gentle Dawn")
    expect(page).to have_content(status) # Will implement this feature later
    expect(page).to have_content(total)
    expect(page).to have_content(order.created_at)
    expect(page).to have_content("#{order.status} at: #{order.updated_at}")

  end
end
