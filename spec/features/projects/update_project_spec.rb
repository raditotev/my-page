require 'spec_helper'

feature "Edit project" do

  before :each do
    sign_in
    @project = create(:project)
     visit edit_project_path(@project)
  end

  scenario "with correct details" do
    expect(page).to have_selector("input#project_title[value='Project Title']")
    expect(page).to have_css "textarea#project_description", text: "Project Text"
    fill_in 'project_title', with: "Test title"
    fill_in 'project_description', with: "Test content"
    click_button 'Update Project'
    expect(page).to have_content "Project was successfully updated."
  end

  scenario "with incorect destails" do
    fill_in 'project_title', with: ""
    fill_in 'project_description', with: ""
    click_button 'Update Project'
    expect(page).to have_content "Check the form for errors and try again."
  end
end
