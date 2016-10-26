require 'spec_helper'

feature "Portfolio page" do

  before :each do
    visit portfolio_path
  end

  subject { page }

  it { is_expected.to have_title "Portfolio | Radi's Page" }
  it { is_expected.to have_css "h1", text: "Projects" }



  scenario "has link to About" do
    click_link 'About'
    expect(current_path).to eq(about_path)
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
