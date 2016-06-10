require 'spec_helper'

describe AdminController do

  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    sign_in @admin
  end

  describe " GET #home" do
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

    it "assigns last 7 projects as @projects" do
      project = {}
      (1..8).each {|n| project[n] = create(:project, title: "Title#{n}")}
      get :home, {}, valid_session
      expect(assigns(:projects)).to eq([project[7], project[6], project[5], project[4], project[3], project[2], project[1]])
    end

    it "assigns last 7 posts as @posts" do
      post = {}
      (1..8).each {|n| post[n] = create(:post, title: "Title#{n}")}
      get :home, {}, valid_session
      expect(assigns(:posts)).to eq([post[7], post[6], post[5], post[4], post[3], post[2], post[1]])
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
      get :projects, valid_session
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
      get :posts, valid_session
      expect(assigns(:posts)).to eq([post])
    end
  end
end
