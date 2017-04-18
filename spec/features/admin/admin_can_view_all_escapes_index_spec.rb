require 'rails_helper'

RSpec.feature "As a logged in admin" do
  scenario "They can view all escapes" do

    escape1, escape2 = create_list(:escape, 2)
    admin = User.create(username: "iadmin", full_name: "colleen", address: "8408 S. Elwood Tulsa, OK 74132", password: "ipass",
    password_confirmation: "ipass", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path
    click_on "View all escapes"
    expect(current_path).to eq("/admin/escapes")

    expect(page).to have_content(escape1.name)
    expect(page).to have_link(escape1.name)
    #expect(page).to have_css("img[src*='img.url']")
    #expect(page.find('#image_1')['src']).to have_content escape1.image
    expect(page).to have_content(escape1.description)
    expect(page).to have_content(escape1.status)

    expect(page).to have_content(escape2.name)
    expect(page).to have_link(escape2.name)
    #expect(page).to have_css("img[src*='img.url']")
    #expect(page.find('#image_2')['src']).to have_content escape1.image
    expect(page).to have_content(escape2.description)
    expect(page).to have_content(escape2.status)

  end

end
    # As an Admin
    # When I visit "/admin/dashboard"
    # Then I should see a link for viewing all items
    # And when I click that link
    # Then my current path should be "/admin/items"
    # Then I should see a table with all items (active and inactive)
    # And each item should have:
    #   - A thumbnail of the image
    #   - Title that links to the item
    #   - Description
    #   - Status
    #   - Actions (Edit)