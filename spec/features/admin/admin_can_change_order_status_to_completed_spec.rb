require 'rails_helper'

RSpec.feature "As admin" do
  scenario "they can change order status to completed" do
    user = create(:user)
    order_1 = user.orders.create(status: "completed", total: 500.00)
    order_2 = user.orders.create(status: "paid", total: 200.00)
    order_3 = user.orders.create(total: 1000.00)
    order_4 = user.orders.create(status: "cancelled", total: 1.00)
    escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", 
                          price: 500.00, city: "San Diago", image: "url")
    order_escape_1 = user.orders.first.order_escapes.create(escape_id: escape_1.id, 
                                                          quantity: 1, total: 500.00)

    escape_2 = Escape.create(name: "Basemant", description: "Coding", 
                          price: 200.00, city: "Denver", image: "url")
    order_escape_2 = user.orders.last.order_escapes.create(escape_id: escape_2.id, 
                                                          quantity: 1, total: 200.00)    
    
    escape_3 = Escape.create(name: "Tropical Getaway", description: "Beach", 
                          price: 1000.00, city: "Costa Rica", image: "url")
    order_escape_3 = user.orders.last.order_escapes.create(escape_id: escape_3.id, 
                                                          quantity: 1, total: 1000.00)  

    escape_4 = Escape.create(name: "Moon Trip", description: "Space", 
                          price: 1.00, city: "The Moon", image: "url")
    order_escape_4 = user.orders.last.order_escapes.create(escape_id: escape_4.id, 
                                                          quantity: 1, total: 1.00)  
                                                                                                            
    admin = User.create(username: "iadmin", password: "ipass", 
                        password_confirmation: "ipass", role: 1, image: "url")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path


    select "paid", from: "status"
    click_on "Filter"
    expect(page).to have_content("#2")
    click_on "Complete"
    visit order_path(order_2)
    expect(page).to have_content("Order Status: completed")

    end 
  end 