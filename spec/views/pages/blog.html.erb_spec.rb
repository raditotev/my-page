require 'spec_helper'

RSpec.describe "pages/blog", type: :view do
  before(:each) do
    @post = create(:post)
    assign(:posts, [@post])
    render
  end

  subject { rendered }


  it { is_expected.to have_css "h3", text: @post.title }
  it { is_expected.to have_link @post.title }
  it {is_expected.to have_link "Continue reading..."}
  it { is_expected.to  have_link "TAG"}
end
