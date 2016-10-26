require 'spec_helper'

RSpec.describe "pages/portfolio", type: :view do

  before(:each) do
    @project = create(:project)
    assign(:projects, [@project])
    render
  end

  subject{ rendered }


  it { is_expected.to have_css "h1", text: "Projects" }
  it { is_expected.to have_link @project.title }
  it { is_expected.to have_css "img[src='#{@project.screenshot.url}']" }
end
