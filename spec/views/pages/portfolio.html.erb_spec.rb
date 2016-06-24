require 'spec_helper'

RSpec.describe "pages/portfolio", type: :view do

  before(:each) do
    @project = create(:project)
    assign(:projects, [@project])
    render
  end

  subject{ rendered }

  pending "test h3 title in top banner"
# it { is_expected.to have_css "h3", text: "Portfolio" }

  it { is_expected.to have_css "h4", text: "Project Title" }
  it { is_expected.to have_css "img[src='#{@project.screenshot.url}']" }
  it { is_expected.to have_css "p", text: "Project Text" }
end
