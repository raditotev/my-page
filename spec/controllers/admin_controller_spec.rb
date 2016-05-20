require 'spec_helper'

describe AdminController do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    sign_in @admin
  end

  describe ".home" do
    it "should load home page when admin signed in" do
      get :home
      expect(response).to be_success
      expect(response).to render_template(:home)
    end

    it "should redirect to sign_in page if user not admin" do
      sign_out @admin
      get :home
      expect(response).to redirect_to new_admin_session_path
    end
  end
end
