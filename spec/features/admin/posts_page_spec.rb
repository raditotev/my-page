require 'spec_helper'

feature "Posts page" do

  before :each do
    sign_in
    @post = create(:post)
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

  scenario "has link deleting post", js: true do
    # expect { click_on 'Delete' }.to change(Post, :count).by(-1)
    # expect(page).to have_content "Post was successfully deleted."
    # expect(page).to_not have_content @post.title
    click_link("Delete")
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    expect(page).to have_content("Post was successfully deleted.")
    expect(page).to_not have_content @post.title
  end
end
