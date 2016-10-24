require 'spec_helper'

feature "Create new project" do

  before :each do
    sign_in
     visit new_project_path
  end

  scenario "with correct details" do
    fill_in 'project_title', with: "Test title"
    fill_in 'project_description', with: "Test content"
    attach_file('Screenshot', "#{Rails.root}/spec/support/images/test_img.png")
    expect { click_button 'Create Project' }.to change(Project, :count).by(1)
  end

  scenario "with incorect destails" do
    click_button 'Create Project'
    expect(page).to have_css "span", text: "can't be blank", count: 3
    expect(page).to have_css ".has-error", count: 3
  end
end
