require 'spec_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, create(:post))
    @tag = @post.tags.first
    @comments = assign(:comments, @post.comments)
    render
  end

  subject { rendered }

  it { is_expected.to have_css "h1", text: "Post Title" }
  it { is_expected.to have_css "#post-content", text: "Post Text" }
  it { is_expected.to have_link "TAG", href: "/tags/TAG" }
end
