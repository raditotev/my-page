require 'spec_helper'

RSpec.describe "admin/home", type: :view do
  before(:each) do
    assign(:posts, [create(:post), create(:post)])
    assign(:projects, [create(:project), create(:project)])
  end

  it "renders a list of posts" do
    render
    assert_select "h3", :text => "Post Title".to_s, :count => 2
    assert_select "h6", :text => "less than a minute ago"
  end

   it "renders a list of projects" do
    render
    assert_select "h3", :text => "Project Title".to_s, :count => 2
    assert_select "h6", :text => "less than a minute ago"
  end
end
