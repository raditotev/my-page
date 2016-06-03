require 'spec_helper'

feature "Projects page" do

before :each do
  @project = create(:project)
  sign_in
  visit admin_projects_path
end

  scenario "links to project show page" do
    click_link 'Show'
    expect(current_path).to eq(project_path(@project))
  end

  scenario "links to project show page" do
    click_link 'Edit'
    expect(current_path).to eq(edit_project_path(@project))
  end

  scenario "deletes project" do
    expect { click_link 'Delete' }.to change(Project, :count).by(-1)
  end
end
