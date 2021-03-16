class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destory]
  def index
    @projects = Project.all
  end

  def show
  end

  def new
  @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to house_projects_path
    else
      render :new
    end
  end

  def destroy
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:name, :deadline, :rich_body, :budget, :photo)
  end
end
