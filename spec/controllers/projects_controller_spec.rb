require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Project. As you add validations to Project, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:project)
  }

  let(:invalid_attributes) {
    {title: nil, description: nil}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    sign_in @admin
  end

  describe "GET #index" do

    context "for admin user" do
      it "opens index page" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context "for non-admin user" do
      it "opens index page" do
        sign_out @admin
        get :index
        expect(response).to render_template(:index)
      end
    end

    it "assigns all projects as @projects" do
      project = Project.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:projects)).to eq([project])
    end

    it "displays most recent first" do
      project1 = Project.create! valid_attributes
      project2 = Project.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:projects)).to eq([project2, project1])
    end
  end

  describe "GET #show" do

    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, {:id => project.to_param}, valid_session
      expect(assigns(:project)).to eq(project)
    end

    context "when admin user" do
      it "opens show page" do
        project = Project.create! valid_attributes
        get :show, {:id => project.to_param}, valid_session
        expect(response).to render_template(:show)
      end
    end

    context "when non-admin user" do
      it "opens show page" do
        sign_out @admin
        project = Project.create! valid_attributes
        get :show, {:id => project.to_param}, valid_session
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #new" do


    context "when admin" do
      it "opens new page" do
        get :new, {}, valid_session
        expect(response).to render_template(:new)
      end
    end

    context "when non-admin" do
       it "redirects to sign_in page if user not admin" do
        sign_out @admin
        get :new, {}, valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns a new project as @project" do
      get :new, {}, valid_session
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do

    context "when admin" do
      it "opens edit page" do
        project = Project.create! valid_attributes
        get :edit, {:id => project.to_param}, valid_session
        expect(response).to render_template(:edit)
      end
    end

    context "when non-admin" do
      it "redirects to sign_in page if user not admin" do
        sign_out @admin
        project = Project.create! valid_attributes
        get :edit, {:id => project.to_param}, valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, {:id => project.to_param}, valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, {:project => valid_attributes}, valid_session
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, {:project => valid_attributes}, valid_session
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, {:project => valid_attributes}, valid_session
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, {:project => invalid_attributes}, valid_session
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, {:project => invalid_attributes}, valid_session
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do

    context "with valid params" do
      let(:new_attributes) {
        {title: "New title", description: "New description"}
      }

      it "updates the requested project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => new_attributes}, valid_session
        project.reload
        new_attributes.each_pair do |key, value|
          expect(project[key]).to eq( value )
        end
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => valid_attributes}, valid_session
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => invalid_attributes}, valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        put :update, {:id => project.to_param, :project => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, {:id => project.to_param}, valid_session
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, {:id => project.to_param}, valid_session
      expect(response).to redirect_to(projects_url)
    end
  end

end
