require 'spec_helper'

feature "About page" do

  before :each do
    visit about_path
  end

  subject { page }

  it { is_expected.to have_title "About | Radi's Page" }
  it { is_expected.to have_css "h1", text: "Radi Totev" }
  it { is_expected.to have_css "h5", text: "Full Stack Developer" }


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
