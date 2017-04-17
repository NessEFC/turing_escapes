require 'rails_helper'

RSpec.feature "A visitor can view all escapes" do
  scenario "from the index page" do

    escape_1, escape_2 = create_list(:escape, 2)

    visit escapes_path

    expect(page).to have_content(escape_1.name)
    expect(page).to have_content(escape_2.name)

  end
end
