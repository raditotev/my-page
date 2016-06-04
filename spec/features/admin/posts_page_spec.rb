require 'spec_helper'

feature "Posts page" do

before :each do
  @post = create(:post)
  sign_in
  visit admin_posts_path
end

  scenario "redirects to home when Admin Panel is clicked" do
    click_link 'Dashboard'
    expect(current_path).to eq(admin_path)
  end

  scenario "has link to post show page" do
    click_link 'Show'
    expect(current_path).to eq(post_path(@post))
  end

  scenario "has link to post edit page" do
    click_link 'Edit'
    expect(current_path).to eq(edit_post_path(@post))
  end

  scenario "deletes post" do
    expect { click_link 'Delete' }.to change(Post, :count).by(-1)
  end
end
