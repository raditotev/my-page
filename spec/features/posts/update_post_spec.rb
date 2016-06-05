require 'spec_helper'

feature "Edit post" do

  before :each do
    sign_in
    @post = create(:post)
     visit edit_post_path(@post)
  end

  scenario "with correct details" do
    expect(page).to have_selector("input#post_title[value='Post Title']")
    expect(page).to have_css "textarea#post_content", text: "Post Text"
    fill_in 'post_title', with: "Test title"
    fill_in 'post_content', with: "Test content"
    click_button 'Update Post'
    expect(page).to have_content "Post was successfully updated."
  end

  scenario "with incorect destails" do
    fill_in 'post_title', with: ""
    fill_in 'post_content', with: ""
    click_button 'Update Post'
    expect(page).to have_content "Check the form for errors and try again."
  end
end
