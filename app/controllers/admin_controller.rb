class AdminController < ApplicationController
  before_action :authenticate_admin!
  after_action :mark_comments_as_read, only: :comments

  def home
    @projects = Project.last(7)
    @posts = Post.last(7)
    @unread_comments = Comment.where(read: false).count
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
    @comments.each { |comment| comment.update_attributes(read: true) }
  end
end
