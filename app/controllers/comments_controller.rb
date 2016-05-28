class CommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Comment created"
      redirect_to @comment.post
    else
      post = Post.find(comment_params[:post_id])
      flash[:error] = "See the error message and try again."
      redirect_to post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :email, :content, :post_id)
  end
end
