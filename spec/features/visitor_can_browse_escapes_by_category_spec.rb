require 'rails_helper'

RSpec.feature "As a visitor," do
  scenario "they can browse escapes by category" do

    category = create(:category_with_escapes)

    visit "/#{category.title}"

    expect(page).to have_content(category.escapes.first.name)

  end
end
