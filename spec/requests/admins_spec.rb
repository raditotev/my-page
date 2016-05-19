require 'spec_helper'

describe "Admin" do
  describe "GET /admins" do
    it "should redirect to sign_in page" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get admin_path
      response.should redirect_to new_admin_session_path
    end
  end
end
