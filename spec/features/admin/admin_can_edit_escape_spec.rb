require 'rails_helper'

RSpec.feature "as a logged in Admin" do
  scenario "they can edit an escape" do
    escape1 = create(:escape)
    admin = User.create(username: "iadmin", full_name: "colleen", address: "8408 S. Elwood Tulsa, OK 74132", password: "ipass",
    password_confirmation: "ipass", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_escapes_path

    click_on "Edit"

    expect(current_path).to eq(edit_admin_escape_path(escape1))

    fill_in "escape[name]", with: "Rough Sunset"
    fill_in "escape[description]", with: "The roughest of sunsets"
    select "retired", :from => "escape[status]"
    click_on "Update"

    expect(current_path).to eq(admin_escapes_path)
    expect(page).to have_content("Rough Sunset")
    expect(page).to have_content("The roughest of sunsets")
    expect(page).to have_content("Retired")

  end
end
