require 'rails_helper'


RSpec.feature "As a logged in user" do
  scenario "they cannot view other users orders" do 

    user_1 = create(:user)
    order_1 = user_1.orders.create
    order_2 = user_1.orders.create
    escape_1 = Escape.create(name: "trip", description: "basement", price: 2.00, city: "gary", image: "url")
    escape_2 = Escape.create(name: "vacation", description: "disney", price: 500.00, city: "orlando", image: "url")
    user_1.orders.first.order_escapes.create(escape_id: escape_1.id, total: 2.00, quantity: 1)
    user_1.orders.last.order_escapes.create(escape_id: escape_2.id, total: 500.00, quantity: 1)


    user_2 = User.create(username: "TheCraigness", password: "password", password_confirmation: "password")
    escape_3 = Escape.create(name: "Green Country", description: "There's literally nothing here", price: 5.00, city: "Tulsa", image: "url")
    order_3 = user_2.orders.create 
    user_2.orders.first.order_escapes.create(escape_id: escape_3.id, total: 5.00, quantity: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit orders_path 

    expect(page).to_not have_content("Order #3")
  end 
end 