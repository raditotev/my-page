require 'spec_helper'

feature "Blog page" do

  before :each do
    create(:post)
    visit blog_path
  end

  subject { page }

  it { is_expected.to have_title "Blog | Radi's Page" }
  it { is_expected.to have_css "h1", text: "Articles" }
  it { is_expected.to have_css "h3", text: "Post Title" }
  it { is_expected.to have_link "Continue reading..." }


  scenario "has link to About" do
    click_link 'About'
    expect(current_path).to eq(about_path)
  end

  scenario "has link to Portfolio" do
    click_link 'Portfolio'
    expect(current_path).to eq(portfolio_path)
  end

  scenario "has link to contact" do
    click_link 'Contact'
    expect(current_path).to eq(contact_path)
  end
end
