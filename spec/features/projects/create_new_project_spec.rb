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
    expect(page).to have_css "h2", text: "3 errors prohibited this project from being saved:"
    expect(page).to have_css "li", text: "Title can't be blank"
    expect(page).to have_css "li", text: "Description can't be blank"
    expect(page).to have_css "li", text: "Screenshot can't be blank"
  end
end
