require 'rails_helper'

RSpec.feature "As an admin," do
  scenario "they can view an individual order's show page" do
    user = create(:user)
    order = user.orders.create(status: "completed", total: 1200.00)
    escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.",
                          price: 500.00, city: "San Diago", image: "url")
    escape_2 = Escape.create(name: "Basemant", description: "Coding",
                          price: 200.00, city: "Denver", image: "url")
    order_escape_1 = user.orders.first.order_escapes.create(escape_id: escape_1.id,
                                                          quantity: 2, total: 1000.00)
    order_escape_2 = user.orders.first.order_escapes.create(escape_id: escape_2.id, quantity: 1, total: 200.00)

    admin = User.create(username: "iadmin", password: "ipass",
                        password_confirmation: "ipass", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit order_path(order)

    expect(page).to have_content(order.format_created_at)
    expect(page).to have_content(user.full_name)
    expect(page).to have_content(user.address)
    expect(page).to have_content(escape_1.name)
    expect(page).to have_content(order_escape_1.quantity)
    expect(page).to have_link("Gentle Dawn")
    expect(page).to have_content(order.status)
    expect(page).to have_content("$500.00")
    expect(page).to have_content("$200.00")
    expect(page).to have_content(order.total)
    expect(page).to have_content(order_escape_1.total)
    expect(page).to have_content("#{order.status} on #{order.format_updated_at}")

  end
end
