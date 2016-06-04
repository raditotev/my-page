require 'spec_helper'

feature "Projects page" do

before :each do
  @project = create(:project)
  sign_in
  visit admin_projects_path
end

  scenario "redirects to home when Admin Panel is clicked" do
    click_link 'Dashboard'
    expect(current_path).to eq(admin_path)
  end

  scenario "has link to project show page" do
    click_link 'Show'
    expect(current_path).to eq(project_path(@project))
  end

  scenario "has link to project show page" do
    click_link 'Edit'
    expect(current_path).to eq(edit_project_path(@project))
  end

  scenario "deletes project" do
    expect { click_link 'Delete' }.to change(Project, :count).by(-1)
  end
end
