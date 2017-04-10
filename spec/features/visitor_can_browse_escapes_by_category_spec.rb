require 'rails_helper'

RSpec.feature "As a visitor," do
  scenario "they can browse escapes by category" do

    category_1 = Category.create(title: "Tropical")
    category_2 = Category.create(title: "Russian")

    escape_1 = category_1.escapes.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 200.00, city: "Denver", image: "image.url")

    escape_2 = category_1.escapes.create(name: "Cuba", description: "Communist Cuba!", price: 10.00, city: "Havana", image: "image.url")

    escape_3 = category_2.escapes.create(name: "Russian Paradise", description: "Russian pride.", price: 50.00, city: "Moscow", image: "image.url")

    escape_4 = category_2.escapes.create(name: "Rough Sunset", description: "The roughest of sunsets.", price: 100.00, city: "St. Petersburg", image: "image.url")

    visit '/Tropical'

    expect(page).to have_content("Gentle Dawn")
    expect(page).to have_content("Cuba")

  end
end
