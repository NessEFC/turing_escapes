require 'rails_helper'

RSpec.feature "As admin" do
  scenario "they can see list of all orders" do
    user = create(:user)
    order_1 = user.orders.create(status: "completed", total: 500.00)
    order_2 = user.orders.create(status: "paid", total: 200.00)
    escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", 
                          price: 500.00, city: "San Diago", image: "url")
    order_escape_1 = user.orders.first.order_escapes.create(escape_id: escape_1.id, 
                                                          quantity: 1, total: 500.00)

    escape_2 = Escape.create(name: "Basemant", description: "Coding", 
                          price: 200.00, city: "Denver", image: "url")
    order_escape_2 = user.orders.last.order_escapes.create(escape_id: escape_2.id, 
                                                          quantity: 1, total: 200.00)                                                      
    admin = User.create(username: "iadmin", password: "ipass", 
                        password_confirmation: "ipass", role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_link("Order #1")
    expect(page).to have_link("Order #2")
  end
end
