require 'spec_helper'

RSpec.describe AdminHelper, type: :helper do

    describe "generates text when" do

      it "it has 0 comments" do
        expect(helper.generate_comments_text(0))
                  .to eq("There are no new comments.")
      end

      it "it has 1 comment" do
        expect(helper.generate_comments_text(1))
                  .to eq("There is 1 new comment.")
      end

       it "it has more than 1 comments" do
        expect(helper.generate_comments_text(3))
                  .to eq("There are 3 new comments.")
      end
    end
end
