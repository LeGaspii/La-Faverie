class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  def index
    @projects = policy_scope(Project.all).reverse
  end

  def show
    @tasks = Task.where(project_id: @project)
    @buyings = Buying.where(project_id: @project)
    @task = Task.new
    @buying = Buying.new
    @usersproject = Usersproject.new
    @usersprojects = Usersproject.where(project_id: @project).includes([:user])
    @usersprojects_past = @usersprojects.where("date_end < ?", Date.today).last(5)
    @usersprojects_futur = @usersprojects.where("date_end >= ?", Date.today)
    @comment = Comment.new
    @comments = Comment.where(project_id: @project).includes([:rich_text_rich_body]).includes([:user]).last(50)
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def edit
    @project = Project.find(params[:id])
    authorize @project
  end

  def update
    @project = Project.find(params[:id])
    authorize @project
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    @project.house = House.find(1)
    if @project.save
      task = Task.new(project_id: @project.id, name: "example")
      task.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    authorize @project
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
