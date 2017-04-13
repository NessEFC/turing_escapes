require "rails_helper"

RSpec.feature "As a user" do
  scenario "they cannot add retired item(s) to cart" do

    escape = create(:escape, active: false)

    visit escape_path(escape)

    expect(page).to_not have_content("Book Escape")
    expect(page).to have_content("Escape Retired")
  end
end
