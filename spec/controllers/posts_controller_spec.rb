require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    sign_in @admin
  end

  describe "GET #show" do
    let(:post){ create(:post) }

    it "opens show page" do
      get :show, {:id => post.to_param}, valid_session
      expect(response).to render_template(:show)
    end

    it "assigns the post related comments as @comments" do
      comment = post.comments.create(attributes_for(:comment))
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:comments)).to eq([comment])
    end
  end

  describe "GET #new" do

    before :each do
      get :new, {}, valid_session
    end

    subject { response }

    context "when admin user" do

      it {is_expected.to render_template :new}
    end

    context "when user not admin" do
      before do
        sign_out @admin
        get :new, {}, valid_session
      end
      it {is_expected.to redirect_to new_admin_session_path}
    end

    it "assigns a new post as @post" do
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do
    let(:post){ create(:post) }
    subject{ response }

    context "when admin user" do
      before do
        get :edit, {id: post.to_param}, valid_session
      end

      it{ is_expected.to render_template(:edit)}
    end

    context "when user not admin" do
      before do
        sign_out @admin
        get :edit, {id: post.to_param}, valid_session
      end

      it{ is_expected.to redirect_to new_admin_session_path }
    end

    it "assigns the requested project as @project" do

      get :edit, {id: post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {post: attributes_for(:post, all_tags: create(:tag))}, valid_session
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {post: attributes_for(:post)}, valid_session
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it "redirects to the created post" do
        post :create, {post: attributes_for(:post)}, valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        post :create, {post: attributes_for(:post, title: nil)}, valid_session
        expect(assigns(:post)).to be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        post :create, {post: attributes_for(:post, title: nil)}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      let(:new_attributes) {
        {title: "Title 1", content: "Text 1"}
      }
      let(:post){ create(:post) }

      it "updates the requested post" do
        put :update, {id: post.to_param, post: new_attributes}, valid_session
        post.reload
        new_attributes.each_pair do |key, value|
          expect(post[key]).to eq( value )
        end
      end

      it "updates the post related tags" do
        put :update, {id: post.to_param, post: {all_tags: "New"}}, valid_session
        post.reload
        expect(post.all_tags).to eq("NEW")
      end

      it "assigns the requested post as @post" do
        put :update, {id: post.to_param, post: attributes_for(:post)}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        put :update, {id: post.to_param, post: attributes_for(:post)}, valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) {
        {title: nil, content: nil}
      }
      let(:post){ create(:post) }

      it "assigns the post as @post" do
        put :update, {id: post.to_param, post: invalid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        put :update, {id: post.to_param, post: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do

    it "destroys the requested post" do
      post = create(:post)
      expect {
        delete :destroy, {id: post.to_param}, valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create(:post)
      delete :destroy, {id: post.to_param}, valid_session
      expect(response).to redirect_to admin_posts_path
    end
  end

end
