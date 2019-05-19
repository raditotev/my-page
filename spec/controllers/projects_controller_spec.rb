require 'spec_helper'

RSpec.describe ProjectsController, type: :controller do

  let(:valid_attributes) {
    attributes_for(:project)
  }

  let(:invalid_attributes) {
    {title: nil, description: nil}
  }

  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryBot.create :admin
    sign_in @admin
  end

  describe "GET #show" do

    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :show, params: {:id => project.to_param}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end

    context "when admin user" do
      it "opens show page" do
        project = Project.create! valid_attributes
        get :show, params: {:id => project.to_param}, session: valid_session
        expect(response).to render_template(:show)
      end
    end

    context "when user not admin" do
      it "opens show page" do
        sign_out @admin
        project = Project.create! valid_attributes
        get :show, params: {:id => project.to_param}, session: valid_session
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #new" do

    context "when admin user" do
      it "opens new page" do
        get :new, params: {}, session: valid_session
        expect(response).to render_template(:new)
      end
    end

    context "when user not admin" do
       it "redirects to sign_in page if user not admin" do
        sign_out @admin
        get :new, params: {}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns a new project as @project" do
      get :new, params: {}, session: valid_session
      expect(assigns(:project)).to be_a_new(Project)
    end
  end

  describe "GET #edit" do

    context "when admin user" do
      it "opens edit page" do
        project = Project.create! valid_attributes
        get :edit, params: {:id => project.to_param}, session: valid_session
        expect(response).to render_template(:edit)
      end
    end

    context "when user not admin" do
      it "redirects to sign_in page if user not admin" do
        sign_out @admin
        project = Project.create! valid_attributes
        get :edit, params: {:id => project.to_param}, session: valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns the requested project as @project" do
      project = Project.create! valid_attributes
      get :edit, params: {:id => project.to_param}, session: valid_session
      expect(assigns(:project)).to eq(project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Project" do
        expect {
          post :create, params: {:project => valid_attributes}, session: valid_session
        }.to change(Project, :count).by(1)
      end

      it "assigns a newly created project as @project" do
        post :create, params: {:project => valid_attributes}, session: valid_session
        expect(assigns(:project)).to be_a(Project)
        expect(assigns(:project)).to be_persisted
      end

      it "redirects to the created project" do
        post :create, params: {:project => valid_attributes}, session: valid_session
        expect(response).to redirect_to(Project.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved project as @project" do
        post :create, params: {:project => invalid_attributes}, session: valid_session
        expect(assigns(:project)).to be_a_new(Project)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:project => invalid_attributes}, session: valid_session
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
        put :update, params: {:id => project.to_param, :project => new_attributes}, session: valid_session
        project.reload
        new_attributes.each_pair do |key, value|
          expect(project[key]).to eq( value )
        end
      end

      it "assigns the requested project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {:id => project.to_param, :project => valid_attributes}, session: valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "redirects to the project" do
        project = Project.create! valid_attributes
        put :update, params: {:id => project.to_param, :project => valid_attributes}, session: valid_session
        expect(response).to redirect_to(project)
      end
    end

    context "with invalid params" do
      it "assigns the project as @project" do
        project = Project.create! valid_attributes
        put :update, params: {:id => project.to_param, :project => invalid_attributes}, session: valid_session
        expect(assigns(:project)).to eq(project)
      end

      it "re-renders the 'edit' template" do
        project = Project.create! valid_attributes
        put :update, params: {:id => project.to_param, :project => invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested project" do
      project = Project.create! valid_attributes
      expect {
        delete :destroy, params: {:id => project.to_param}, session: valid_session
      }.to change(Project, :count).by(-1)
    end

    it "redirects to the projects list" do
      project = Project.create! valid_attributes
      delete :destroy, params: {:id => project.to_param}, session: valid_session
      expect(response).to redirect_to admin_projects_path
    end
  end

end
