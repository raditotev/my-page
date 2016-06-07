require 'spec_helper'

RSpec.describe Post, type: :model do

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  describe "validation" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
  end

  describe "association" do
    it { should have_many(:taggings) }
    it { should have_many(:tags).through(:taggings) }
  end

  describe "#all_tags" do
    it "creates post tags" do
      post = Post.create(title: "Title", content: "Text", all_tags: "tag")
      expect(post.tags.count).to eq 1
    end

    it "returns tags capitalized in a string" do
      post = Post.create(title: "Title", content: "Text", all_tags: "tag1, tag2")
      expect(post.all_tags).to eq("TAG1, TAG2")
    end
  end

  describe ".tagged_with" do

    it "returns list of posts with same tag name" do
      Post.destroy_all
      Post.create(title: "Title1", content: "Text1", all_tags: "Tag")
      expect(Post.tagged_with("TAG").count).to eq 1
      Post.create(title: "Title2", content: "Text2", all_tags: "Tag")
      expect(Post.tagged_with("TAG").map{|post| post.title}.join(", ")).to eq "Title2, Title1"
    end
  end
end
