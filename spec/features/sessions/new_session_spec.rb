require 'spec_helper'

feature "Admin logs in" do

  before :each do
     visit new_admin_session_path
  end

  scenario "with correct details" do
    admin = create(:admin)
    expect(page).to have_css("h2", text: "Log in")
    fill_in 'Email', with: admin.email
    fill_in 'Password', with: admin.password
    click_button 'Log in'
    expect(current_path).to eq(admin_path)
  end

  scenario "with incorect destails" do
    expect(page).to have_css("h2", text: "Log in")
    fill_in 'Email', with: "not_admin@mail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(current_path).to eq(new_admin_session_path)
  end
end
