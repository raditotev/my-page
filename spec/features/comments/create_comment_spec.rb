require 'spec_helper'

feature "Create comment" do

  before :each do
    @post = create(:post)
    visit post_path @post
  end

  scenario "with valid details", js: true do
    expect(page).to have_button 'Comment', disabled: true
    fill_in 'comment[author]', with: 'John'
    fill_in 'comment[email]', with: 'john@mail.com'
    fill_in 'comment[content]', with: 'This is a comment.'
    expect(page).to have_button 'Comment', disabled: false
    click_on 'Comment'
    wait_for_ajax
    expect(page).to have_css "h4", text: "John"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with present content but missing author", js: true do
    expect(page).to have_button 'Comment', disabled: true
    fill_in 'comment[content]', with: 'This is a comment.'
    expect(page).to have_button 'Comment', disabled: false
    click_on 'Comment'
    wait_for_ajax
    expect(page).to have_css "h4", text: "Anonymous"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with invalid details", js: true do
    expect(page).to have_button 'Comment', disabled: true
  end

end
