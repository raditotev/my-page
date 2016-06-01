class AdminController < ApplicationController
  before_action :authenticate_admin!

  def home
    @projects = Project.all.reverse.last(3)
    @posts = Post.all.reverse.last(3)
  end

  def projects
    @projects = Project.all
  end

  def posts
    @posts = Post.all
  end
end
