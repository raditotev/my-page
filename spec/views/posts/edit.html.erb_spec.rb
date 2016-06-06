require 'spec_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, create(:post))
    render
  end

  it "renders the edit post form" do

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_all_tags[name=?]", "post[all_tags]"
    end
  end
end
