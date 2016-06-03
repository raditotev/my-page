require 'spec_helper'

feature "Home page" do

before :each do
  visit admin_path
  sign_in
end

  scenario "visit" do
    expect(page).to have_title "My Blog"
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_css "a", text: "Projects"
    expect(page).to have_css "a", text: "Posts"
    expect(page).to have_css "a", text: "New"
    expect(page).to have_css "h2", text: "Projects"
    expect(page).to have_css "h2", text: "Posts"
  end
end
