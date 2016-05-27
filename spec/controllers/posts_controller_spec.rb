require 'spec_helper'

RSpec.describe PostsController, type: :controller do

  # let(:valid_attributes) {
  #   attributes_for(:post)
  # }

  # let(:invalid_attributes) {
  #   {title: nil, content: nil}
  # }

  let(:valid_session) { {} }

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    sign_in @admin
    Post.destroy_all
  end

  describe "GET #index" do

    it "opens index page" do
      get :index
      expect(response).to render_template(:index)
    end

    it "assigns all posts as @posts" do
      post = create(:post)
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post])
    end

    it "displays most recent first" do
      post1 = create(:post)
      post2 = create(:post, title: "Title1")
      get :index, {}, valid_session
      expect(assigns(:posts)).to eq([post2, post1])
    end

    describe "when tag passed in params" do

      it "returns posts with the same tag"do
        post1 = create(:post, all_tags: "Tag")
        post2 = create(:post, all_tags: "Different")
        post3 = create(:post, all_tags: "Tag")
        get :index, {tag: "Tag"}, valid_session
        expect(assigns(:posts)).to eq([post3, post1])
      end


    end
  end

  describe "GET #show" do

    it "assigns the requested post as @post" do
      post = create(:post)
      get :show, {:id => post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end

    context "when admin user" do
      it "opens show page" do
        post = create(:post)
        get :show, {:id => post.to_param}, valid_session
        expect(response).to render_template(:show)
      end
    end

    context "when user not admin" do
      it "opens show page" do
        sign_out @admin
        post = create(:post)
        get :show, {:id => post.to_param}, valid_session
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #new" do

    context "when admin user" do
      it "opens new page" do
        get :new, {}, valid_session
        expect(response).to render_template(:new)
      end
    end

    context "when user not admin" do
       it "redirects to sign_in page if user not admin" do
        sign_out @admin
        get :new, {}, valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns a new post as @post" do
      get :new, {}, valid_session
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #edit" do

    context "when admin user" do
      it "opens edit page" do
        post = create(:post)
        get :edit, {id: post.to_param}, valid_session
        expect(response).to render_template(:edit)
      end
    end

    context "when user not admin" do
      it "redirects to sign_in page if user not admin" do
        sign_out @admin
        project = create(:post)
        get :edit, {id: project.to_param}, valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end

    it "assigns the requested project as @project" do
      post = create(:post)
      get :edit, {id: post.to_param}, valid_session
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do

    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, {post: attributes_for(:post)}, valid_session
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

      it "updates the requested post" do
        post = create(:post)
        put :update, {id: post.to_param, post: new_attributes}, valid_session
        post.reload
        new_attributes.each_pair do |key, value|
          expect(post[key]).to eq( value )
        end
      end

      it "assigns the requested post as @post" do
        post = create(:post)
        put :update, {id: post.to_param, post: attributes_for(:post)}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "redirects to the post" do
        post = create(:post)
        put :update, {id: post.to_param, post: attributes_for(:post)}, valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do

      let(:invalid_attributes) {
        {title: nil, content: nil}
      }

      it "assigns the post as @post" do
        post = create(:post)
        put :update, {id: post.to_param, post: invalid_attributes}, valid_session
        expect(assigns(:post)).to eq(post)
      end

      it "re-renders the 'edit' template" do
        post = create(:post)
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
      expect(response).to redirect_to(posts_url)
    end
  end

end
