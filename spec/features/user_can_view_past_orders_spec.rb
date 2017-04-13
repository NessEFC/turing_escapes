require 'rails_helper'

RSpec.feature "As a logged-in user" do
  scenario "they can view past orders" do

    user = create(:user)
    order_1 = user.orders.create
    order_2 = user.orders.create
    escape_1 = user.orders.first.escapes.create(name: "trip", description: "basement", price: 2.00, city: "gary", image: "url")
    escape_2 = user.orders.last.escapes.create(name: "vacation", description: "disney", price: 500.00, city: "orlando", image: "url")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit orders_path

    expect(page).to have_content(order_1.id)
    expect(page).to have_content(order_1.format_created_at)
    expect(page).to have_content(order_2.id)
    expect(page).to have_content(order_2.format_created_at)
  end
end
