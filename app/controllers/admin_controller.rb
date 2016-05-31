class AdminController < ApplicationController
  before_action :authenticate_admin!

  def home
    @projects = Project.all
    @posts = Post.all
  end
end
