require 'spec_helper'

RSpec.describe Comment, type: :model do

  it "has a valid factory" do
    expect(build(:comment)).to be_valid
  end

  describe "validation" do
    it {should validate_presence_of(:content)}
  end

  describe "association" do
    it { should belong_to(:post) }
  end

end
