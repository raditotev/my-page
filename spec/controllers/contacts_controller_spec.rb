require 'spec_helper'

RSpec.describe ContactsController, type: :controller do

  let(:valid_session) { {} }

  describe "GET #new" do
    before :each do
      get :new, params: {}, session: valid_session
    end
    subject{response}

    it{is_expected.to have_http_status(:success)}
    it{is_expected.to render_template(:new)}

    it "assigns new contact as @contact" do
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "GET #create" do

    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end

    context "with valid details" do
      before :each do
        post :create, params: {contact: attributes_for(:contact)}, session: valid_session
      end

      it "assigns a newly created contact as @contact" do
        expect(assigns(:contact)).to be_a(Contact)
      end

      it "redirects to new contact on success" do
        expect(response).to redirect_to contact_path
      end
    end

    context "with invalid details" do
      before :each do
        post :create, params: {contact: attributes_for(:contact, name: nil, email: nil, message: nil)}, session: valid_session
      end

      it "assigns a newly created but unsaved contact as @contact" do
        expect(assigns(:contact)).to be_a_new(Contact)
      end

       it "re-renders the 'new' template" do
        expect(response).to render_template("new")
      end
    end

  end

end
