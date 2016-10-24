require 'spec_helper'

feature "Posts page" do

  before :each do
    sign_in
    @post = create(:post)
    visit admin_posts_path
  end

  subject { page }

  it { is_expected.to have_link "Projects" }
  it { is_expected.to have_link "Project" }
  it { is_expected.to have_link "Posts" }
  it { is_expected.to have_link "Post" }
  it { is_expected.to have_link "#{@post.title}" }
  it { is_expected.to have_link "Show" }
  it { is_expected.to have_link "Edit" }
  it { is_expected.to have_link "Delete" }
  it { is_expected.to have_css "h3", text: "#{@post.title}" }

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
    click_link("Delete")
    a = page.driver.browser.switch_to.alert
    expect(a.text).to eq("Are you sure?")
    a.accept
    expect(page).to have_content("Post was successfully deleted.")
    expect(page).to_not have_content @post.title
  end

  scenario "has log out" do
    click_link 'Log out'
    expect(current_path).to eql root_path
  end
end
