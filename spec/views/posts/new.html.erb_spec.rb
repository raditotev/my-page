require 'spec_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, build(:post))
  render
  end

  it "renders new post form" do


    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_all_tags[name=?]", "post[all_tags]"
    end
  end
end
