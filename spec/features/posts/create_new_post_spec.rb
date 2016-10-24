require 'spec_helper'

feature "Create new post" do

  before :each do
    sign_in
     visit new_post_path
  end

  scenario "with correct details" do
    fill_in 'post_title', with: "Test title"
    fill_in 'post_content', with: "Test content"
    expect { click_button 'Create Post' }.to change(Post, :count).by(1)
  end

  scenario "with correct details and tags" do
    fill_in 'post_title', with: "Test title"
    fill_in 'post_content', with: "Test content"
    fill_in 'post_all_tags', with: "Test, Post"
    expect { click_button 'Create Post' }.to change(Tag, :count).by(2)
  end

  scenario "with incorect destails" do
    click_button 'Create Post'
    expect(page).to have_css "span", text: "can't be blank", count: 2
    expect(page).to have_css ".has-error", count: 2
  end
end
