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
    let(:valid_attributes) { attributes_for(:comment, post_id: @post.id) }
    let(:invalid_attributes) { attributes_for(:comment, content: nil, post_id: @post.id) }

    context "with valid params" do
      it "creates a new comment" do
        expect {
          post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

      it "redirects to the commented post" do
        post :create, {post_id: @post.id, comment: valid_attributes}, valid_session
        expect(response).to redirect_to(Post.find(@post.id))
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
    it "destroys the requested comment" do
      comment = create(:comment, post_id: @post.id)
      expect {
        delete :destroy, {post_id: @post.id, id: comment.to_param}, valid_session
      }.to change(Comment, :count).by(-1)
    end

    it "redirects back to the posts" do
      comment = create(:comment, post_id: @post.id)
      delete :destroy, {post_id: @post.id, id: comment.to_param}, valid_session
      expect(response).to redirect_to @post
    end
  end
end
