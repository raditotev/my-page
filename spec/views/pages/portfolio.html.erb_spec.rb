require 'spec_helper'

RSpec.describe "pages/portfolio", type: :view do

  before(:each) do
    @project = create(:project)
    assign(:projects, [@project])
    render
  end

  subject{ rendered }


  it { is_expected.to have_css "h3", text: "Projects" }
  it { is_expected.to have_css "#project-title" }
  it { is_expected.to have_css "h4", text: "Project Title" }
  it { is_expected.to have_link "Project Title" }
  it { is_expected.to have_css "img[src='#{@project.screenshot.url}']" }
  it { is_expected.to have_css "p", text: "Details" }
  it { is_expected.to have_link "Details" }
end
