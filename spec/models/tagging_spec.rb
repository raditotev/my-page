require 'spec_helper'

RSpec.describe Tagging, type: :model do
  describe "association" do
    it{ should belong_to(:post) }
    it{ should belong_to(:tag) }
  end
end
