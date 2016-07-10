require 'spec_helper'

feature "About page" do

  before :each do
    visit root_path
  end

  subject { page }

  it { is_expected.to have_link "About" }
  it { is_expected.to have_link "Portfolio" }
  it { is_expected.to have_link "Blog" }
  it { is_expected.to have_link "Contact" }

  scenario "has link to About" do
    click_link 'About'
    expect(current_path).to eq(about_path)
  end

  scenario "has link to Portfolio" do
    click_link 'Portfolio'
    expect(current_path).to eq(portfolio_path)
  end

  scenario "has link to Blog" do
    click_link 'Blog'
    expect(current_path).to eq(blog_path)
  end

  scenario "has link to contact" do
    click_link 'Contact'
    expect(current_path).to eq(contact_path)
  end
end
