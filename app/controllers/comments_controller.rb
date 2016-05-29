class CommentsController < ApplicationController
  before_action :authenticate_admin!, only: :destroy
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post, flash: { success: "Comment created" } }
        format.js
      end
    else
      flash[:alert] = "See the error message and try again."
      redirect_to @post
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post, flash: { success: "Comment was deleted" } }
      format.js
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author, :email, :content)
  end
end
