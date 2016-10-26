require 'spec_helper'

feature "Show project" do

  before { @project = create(:project) }

  before :each do
    visit project_path @project
  end

  subject { page }

  it { is_expected.to have_css "h1", text: @project.title}
  it { is_expected.to have_css "img[src='#{@project.screenshot.url}']" }
  it { is_expected.to have_link "Source code" }
  it { is_expected.to have_link "Live demo" }

  scenario "without github url" do
    @project.update_attributes(github_url: nil)
    visit project_path @project
    expect(page).not_to have_link "Source code"
    expect(page).to have_link "Live demo"
  end

  scenario "without demo url" do
    @project.update_attributes(demo_url: nil)
    visit project_path @project
    expect(page).not_to have_link "Live demo"
    expect(page).to have_link "Source code"
  end
end
