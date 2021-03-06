class PostsController < ApplicationController
  before_action :authenticate_admin!, except: :show
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout "admin", only: [:new, :edit, :create]

  # GET /posts/1
  def show
    @comments = @post.comments
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
      flash[:success] = "Post was successfully created."
    else
      flash.now[:error] = "Something went wrong, please try again."
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      flash[:success] = "Post was successfully updated."
      redirect_to @post
    else
      flash.now[:error] = "Check the form for errors and try again."
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to admin_posts_path
    flash[:success] = "Post was successfully deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :all_tags)
    end
end
