require 'spec_helper'

feature "Admin Home page" do

# given(:admin) { create(:admin) }

before :each do
  sign_in
end

  scenario "visit home page as admin" do
    # visit admin_path
    # expect(page).to have_title "My Blog"
    # expect(page).to have_css "h2", text: "Log in"
    # fill_in 'Email', with: admin.email
    # fill_in 'Password', with: admin.password
    # click_button 'Log in'
    expect(page).to have_css "h1", text: "Admin Panel"
  end

end
