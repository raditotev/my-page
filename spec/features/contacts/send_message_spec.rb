require 'spec_helper'

feature "Send message" do

  before :each do
    visit new_contact_path
  end

  scenario "with valid details", js: true do
    expect(page).to have_button 'Send', disabled: true
    fill_in 'contact[name]', with: 'John'
    fill_in 'contact[email]', with: 'john@mail.com'
    fill_in 'contact[message]', with: 'This is a comment.'
    expect(page).to have_button 'Send', disabled: false
    click_on 'Send'
    wait_for_ajax
    expect(page).to have_css ".alert-success", text: "Thank you for your message."
  end

  scenario "with invalid details", js: true do
    expect(page).to have_button 'Send', disabled: true
  end
end
