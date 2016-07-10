require 'spec_helper'


RSpec.describe PostsHelper, type: :helper do
  describe "converts tags in links" do
    tags = "tag1, tag2"
    expected_output = '<a href="/tags/tag1">tag1</a>, <a href="/tags/tag2">tag2</a>'
    it { expect(helper.tag_links(tags)).to eql expected_output }
  end
end
