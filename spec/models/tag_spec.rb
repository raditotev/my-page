require 'spec_helper'

RSpec.describe Tag, type: :model do
  describe "association" do
    it { should have_many(:taggings) }
    it { should have_many(:posts).through(:taggings) }
  end
end
