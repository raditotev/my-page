require 'spec_helper'

RSpec.describe "admin/home", type: :view do
  before(:each) do
    assign(:posts, [create(:post, title: "Post Title1"), create(:post, title: "Post Title2")])
    assign(:projects, [create(:project, title: "Project Title1"), create(:project, title: "Project Title2")])
  end

  it "renders a list of posts" do
    render
    assert_select "h3", :text => "Post Title1"
    assert_select "h6", :text => "less than a minute ago".to_s, count: 4 # 2 Posts + 2 Projects
    assert_select "h3", :text => "Post Title2"
    assert_select "h6", :text => "less than a minute ago"
  end

   it "renders a list of projects" do
    render
    assert_select "h3", :text => "Project Title1"
    assert_select "h3", :text => "Project Title2"
  end
end
