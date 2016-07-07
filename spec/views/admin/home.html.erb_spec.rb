require 'spec_helper'

RSpec.describe "admin/home", type: :view do

  it "generates text for 0 unread comments" do
    assign(:unread_comments, 0)
    render
    assert_select "h5", :text => "There are no new comments."
  end

   it "generates text for 1 unread comment" do
    assign(:unread_comments, 1)
    render
    assert_select "h5", :text => "There is 1 new comment."
  end

  it "generates text for multiple unread comment" do
    assign(:unread_comments, 3)
    render
    assert_select "h5", :text => "There are 3 new comments."
  end
end
