require 'spec_helper'

RSpec.describe ApplicationHelper, type: :helper do

    describe "returns first paragraph from content" do

      text = "<p>First paragraph.</p>
                  <p>Second paragraph.</p>"

     it { expect(helper.get_first_paragraph(text))
                  .to eq("First paragraph.") }
    end
end
