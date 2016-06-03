require 'spec_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    assign(:posts, [create(:post), create(:post)])
  end

  it "renders a list of posts" do
    render
    assert_select "tr>td", :text => "Post Title".to_s, :count => 2
    assert_select "tr>td", :text => "Post Text".to_s, :count => 2
  end
end
