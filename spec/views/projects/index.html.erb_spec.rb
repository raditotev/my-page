require 'spec_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [create(:project), create(:project)])
    render
  end

  it "renders a list of projects" do
    assert_select "tr>td", :text => "Project Title".to_s, :count => 2
    assert_select "tr>td", :text => "Project Text".to_s, :count => 2
  end
end
