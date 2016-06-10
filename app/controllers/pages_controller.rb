class PagesController < ApplicationController
  def about
  end

  def portfolio
    @projects = Project.all
  end

  def blog
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end
end
