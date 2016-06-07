require 'spec_helper'

RSpec.describe "posts/index", type: :view do
  before(:each) do
    @post = create(:post)
    assign(:posts, [@post])
    render
  end

  subject { rendered }

  it { is_expected.to have_css "h1", text: "Blog" }
  it { is_expected.to have_css "h3", text: "Post Title" }
  it { is_expected.to have_link "Post Title" }
  it { is_expected.to  have_link "TAG"}
  it { is_expected.to have_css "p", text: "#{@post.created_at.strftime("%e %B, %Y")}" }
end
