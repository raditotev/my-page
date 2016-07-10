require 'spec_helper'

feature "Contact page" do

  before :each do
    visit contact_path
  end

  subject { page }

  it { is_expected.to have_title "Contact | Radi's Page" }
  it { is_expected.to have_css "h1", text: "Contact" }



  scenario "has link to About" do
    click_link 'About'
    expect(current_path).to eq(about_path)
  end

  scenario "has link to Portfolio" do
    click_link 'Portfolio'
    expect(current_path).to eq(portfolio_path)
  end

  scenario "has link to contact" do
    click_link 'Blog'
    expect(current_path).to eq(blog_path)
  end
end
