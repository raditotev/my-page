require 'spec_helper'

feature "Create comment" do

  before :each do
    @post = create(:post)
    visit post_path @post
  end

  scenario "with valid details", js: true do
    expect(page).to have_button 'Leave comment', disabled: true
    fill_in 'comment[author]', with: 'John'
    fill_in 'comment[email]', with: 'john@mail.com'
    fill_in 'comment[content]', with: 'This is a comment.'
    expect(page).to have_button 'Leave comment', disabled: false
    click_on 'Leave comment'
    wait_for_ajax
    expect(page).to have_css "h5", text: "John"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with present content but missing author", js: true do
    expect(page).to have_button 'Leave comment', disabled: true
    fill_in 'comment[content]', with: 'This is a comment.'
    expect(page).to have_button 'Leave comment', disabled: false
    click_on 'Leave comment'
    wait_for_ajax
    expect(page).to have_css "h5", text: "Anonymous"
    expect(page).to have_css "p", text: "This is a comment."
  end

  scenario "with invalid details", js: true do
    expect(page).to have_button 'Leave comment', disabled: true
  end

end
