require 'spec_helper'

feature "Home page" do

before :each do
  sign_in
end

  scenario "visit" do
    visit admin_path
    expect(page).to have_title "My Blog"
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_css "a", text: "Projects"
  end

end
