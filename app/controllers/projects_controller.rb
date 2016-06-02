class ProjectsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project
      flash[:success] = "Project was successfully created."
    else
      flash.now[:error] = "Something went wrong, please try again."
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update

    if @project.update(project_params)
      redirect_to @project
      flash[:success] = "Project was successfully updated."
    else
      flash.now[:error] = "Check the form for errors and try again."
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to admin_projects_path
    flash[:success] = "Project was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :screenshot)
    end
end
