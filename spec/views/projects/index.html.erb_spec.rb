require 'spec_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        attributes_for(:project)
      ),
      Project.create!(
        attributes_for(:project)
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => "MyTitle".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
