require 'spec_helper'

RSpec.describe CommentsController, type: :controller do

  let(:valid_session){ {}}

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    @admin = FactoryGirl.create :admin
    @post = FactoryGirl.create :post
    sign_in @admin
    Comment.destroy_all
  end

  describe "POST #create" do
    let(:valid_attributes) { attributes_for(:comment) }
    let(:invalid_attributes) { attributes_for(:comment, content: nil) }

    context "with valid params" do
      it "creates a new comment" do
        expect {
          post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "creates new comment" do
        expect {
          post :create,{post_id: @post.id, comment: attributes_for(:comment), format: :js}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the commented post" do
        post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        expect(response).to redirect_to(Post.friendly.find(@post.id))
      end
    end

    context "with invalid params" do
      it "redirects back to the post" do
        post :create, {post_id: @post.id, comment: invalid_attributes}, valid_session
        expect(response).to redirect_to @post
      end
    end
  end

  describe "DELETE #destroy" do

    context "when user admin" do

      before :each do
        @comment = @post.comments.create(attributes_for(:comment))
      end

       it "destroys the requested comment" do
        expect {
          delete :destroy, {post_id: @post.id, id: @comment.to_param}, valid_session
        }.to change(Comment, :count).by(-1)
      end

      it "redirects back to the posts" do
        delete :destroy, {post_id: @post.id, id: @comment.to_param}, valid_session
        expect(response).to redirect_to @post
      end

      it "responds to js" do
        expect {
          delete :destroy,{post_id: @post.id, id: @comment.to_param, format: :js}, valid_session
        }.to change(Comment, :count).by(-1)
      end
    end

    context "when user not admin" do
      it "redirects to login page" do
        sign_out @admin
        comment = create(:comment, post: @post)
        delete :destroy, {post_id: @post.id, id: comment.to_param}, valid_session
        expect(response).to redirect_to new_admin_session_path
      end
    end
  end
end
