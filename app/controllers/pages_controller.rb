class PagesController < ApplicationController
  def about
  end

  def portfolio
    @projects = Project.all
  end

  def blog
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @posts = Post.all
    end
  end

  def download_cv
    send_file(
      "#{Rails.root}/public/documents/radi_cv.pdf",
      filename: "radi_cv.pdf",
      disposition: 'inline',
      type: "application/pdf"
    )
  end
end
