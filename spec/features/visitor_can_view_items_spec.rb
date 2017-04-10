require 'rails_helper'

RSpec.feature "A visitor can view all escapes" do
  scenario "from the index page" do

    escapes = create_list(:escape, 2)

    # escape_1 = Escape.create(name: "Gentle Dawn", description: "The gentlest of dawns.", price: 200.00, city: "Denver", image: "image.url")
    #
    # escape_2 = Escape.create(name: "Rough Sunset", description: "The roughest of sunsets.", price: 100.00, city: "Tulsa", image: "image.url")

    visit escapes_path

    expect(page).to have_content(escape_1.name)
    expect(page).to have_content(escape_2.name)

  end
end
