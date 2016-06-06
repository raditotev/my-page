require 'spec_helper'

feature "Create comment" do

  before :each do
    @post = create(:post)
    visit post_path @post
  end

  scenario "with valid details", js: true do
    fill_in 'comment[author]', with: 'John'
    fill_in 'comment[email]', with: 'john@mail.com'
    fill_in 'comment[content]', with: 'This is a comment.'
    click_on 'Create Comment'
    wait_for_ajax
    expect(page).to have_css "strong", text: "John"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with present content but missing author", js: true do
    # fill_in 'comment[author]', with: ''
    fill_in 'comment[content]', with: 'This is a comment.'
    click_on 'Create Comment'
    wait_for_ajax
    expect(page).to have_css "strong", text: "Anonymous"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with invalid details", js: true do
    click_on 'Create Comment'
    wait_for_ajax
    expect(page).to have_css ".alert-error", text: "Please leave comment."
  end

end
