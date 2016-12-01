require 'spec_helper'

feature "Show post" do

  before do
    @comment = create(:comment)
    @post = @comment.post
    @comments = @post.comments
  end

  before :each do
    visit post_path @post
  end

  subject { page }

  it { is_expected.to have_css "h1", text: "#{@post.title}" }
  it { is_expected.to have_css "p", text: "#{@post.created_at.strftime('%e %B, %Y').strip}" }
  it { is_expected.to have_css "#post-content", text: "#{@post.content}" }
  it { is_expected.to have_css "h4", text: "Comments" }
  it { is_expected.to have_css "h4", text: "#{@comment.author}" }
  it { is_expected.to have_css "p", text: "#{@comment.content}" }
  it { is_expected.not_to have_link "Delete" }

  scenario "when user is admin" do
    sign_in
    visit post_path @post
    expect(page).to have_link "Delete"
  end
end
