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

  scenario "links to projects" do
    click_link 'Projects'
    expect(current_path).to eq(admin_projects_path)
  end

  scenario "links to posts" do
    click_link 'Posts'
    expect(current_path).to eq(admin_posts_path)
  end

  scenario "links to new project" do
    click_link 'new-project-link'
    expect(current_path).to eq(new_project_path)
  end

  scenario "links to new post" do
    click_link 'new-post-link'
    expect(current_path).to eq(new_post_path)
  end
end
