require 'spec_helper'

RSpec.describe Post, type: :model do

   it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  describe "Model validation" do

    it "is invalid without title" do
      expect(build(:post, title: nil)).to be_invalid
    end

    it "is invalid without descriprtion" do
      expect(build(:post, content: nil)).to be_invalid
    end
  end
end
