require 'spec_helper'

RSpec.describe "pages/blog", type: :view do
  before(:each) do
    @post = create(:post)
    assign(:posts, [@post])
    render
  end

  subject { rendered }

  pending "test h3 title in top banner"
# it { is_expected.to have_css "h3", text: "Blog" }

  it { is_expected.to have_css "h4", text: "Post Title" }
  it { is_expected.to have_link "Post Title" }
  it { is_expected.to  have_link "TAG"}
end
