require 'spec_helper'

describe AdminController do

  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryBot.create :admin
    sign_in @admin
  end

  describe " GET #home" do
    it "should load home page when admin signed in" do
      get :home
      expect(response).to be_successful
      expect(response).to render_template(:home)
    end

    it "should redirect to sign_in page if user not admin" do
      sign_out @admin
      get :home
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns unread comments as @unread_comments" do
      post = create(:post)
      comment = create(:comment, post: post)
      get :home, params: {}, session: valid_session
      expect(assigns(:unread_comments)).to eq 1
    end
  end

  describe "GET #projects" do

    it "should redirect to sign_in page if user not admin" do
      sign_out @admin
      get :projects
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns all projects as @projects" do
      project = create(:project)
      get :projects, session: valid_session
      expect(assigns(:projects)).to eq([project])
    end
  end

  describe "GET #posts" do

     it "should redirect to sign_in page if user not admin" do
      sign_out @admin
      get :projects
      expect(response).to redirect_to new_admin_session_path
    end

    it "assigns all posts as @posts" do
      post = create(:post)
      get :posts, session: valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end
end
