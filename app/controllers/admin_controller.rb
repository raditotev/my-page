class AdminController < ApplicationController
  before_action :authenticate_admin!

  def home
    @projects = Project.last(7)
    @posts = Post.last(7)
  end

  def projects
    @projects = Project.all
  end

  def posts
    @posts = Post.all
  end
end
