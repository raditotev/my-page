require 'spec_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, create(:post))
    @comments = assign(:comments, @post.comments)
    render
  end

  it "renders attributes in <p>" do
    expect(rendered).to match(/Post Title/)
    expect(rendered).to match(/Post Text/)
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Content/)
  end
end
