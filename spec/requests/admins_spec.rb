require 'spec_helper'

describe "Admin" do
  describe "GET /admins" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_path
      response.should redirect_to new_admin_session_path
    end
  end
end
