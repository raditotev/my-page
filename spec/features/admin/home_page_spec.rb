require 'spec_helper'

feature "Home page" do

before :each do
  visit admin_path
  sign_in
end

  scenario "visit" do
    expect(page).to have_title "Admin"
    expect(page).to have_css "h1", text: "Admin Panel"
    expect(page).to have_css "a", text: "Projects"
    expect(page).to have_css "a", text: "Posts"
  end

  scenario "has link to projects" do
    click_link 'Projects'
    expect(current_path).to eq(admin_projects_path)
  end

  scenario "has link to posts" do
    click_link 'Posts'
    expect(current_path).to eq(admin_posts_path)
  end

  scenario "has link to new project" do
    click_link 'Create project'
    expect(current_path).to eq(new_project_path)
  end

  scenario "has link to new post" do
    click_link 'Create post'
    expect(current_path).to eq(new_post_path)
  end
end
