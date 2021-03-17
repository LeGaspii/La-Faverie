class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  def index
    @projects = Project.all
  end

  def show
    @tasks = Task.where(project_id: @project)
    @buyings = Buying.where(project_id: @project)
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
    @project.house = House.find(1)
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:name, :deadline, :rich_body, :budget, :photo)
  end
end
