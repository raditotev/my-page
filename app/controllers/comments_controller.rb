class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: :destroy
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      flash[:success] = "Comment created"
      redirect_to @post
    else
      flash[:alert] = "See the error message and try again."
      redirect_to @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:success] = "Comment was deleted"
    redirect_to @post
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :email, :content)
  end
end
