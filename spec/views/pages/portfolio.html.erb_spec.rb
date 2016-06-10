require 'spec_helper'

RSpec.describe "pages/portfolio", type: :view do

  before(:each) do
    @project = create(:project)
    assign(:projects, [@project])
    render
  end

  subject{ rendered }

  it { is_expected.to have_css "h1", text: "Projects" }
  it { is_expected.to have_css "h3", text: "Project Title" }
  it { is_expected.to have_css "img[src='#{@project.screenshot.url}']" }
  it { is_expected.to have_css "p", text: "Project Text" }
end
