require 'spec_helper'

RSpec.describe Project, type: :model do

  it "has a valid factory" do
    expect(build(:project)).to be_valid
  end

  describe "Model validation" do

    it "is invalid without title" do
      expect(build(:project, title: nil)).to_not be_valid
    end

    it "is invalid without descriprtio" do
      expect(build(:project, description: nil)).to_not be_valid
    end

    it "is invalid without screenshot" do
      expect(build(:project, screenshot: nil)).to_not be_valid
    end
  end
end
