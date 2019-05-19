class AdminController < ApplicationController
  before_action :authenticate_admin!
  after_action :mark_comments_as_read, only: :comments

  def home
    @unread_comments = Comment.where(read: 0).count
  end

  def projects
    @projects = Project.all
  end

  def posts
    @posts = Post.all
  end

  def comments
    @comments = Comment.all
  end

  private

  def mark_comments_as_read
    @comments.each { |comment| comment.update_attributes(read: 1) }
  end
end
