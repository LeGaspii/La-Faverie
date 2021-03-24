class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def show
  end

  def new
  @project = Project.find(params[:project_id])
  @task = Task.new
  authorize @task
  end

  def edit
    authorize @task
    @task = Task.find(params[:id])
  end

  def update
    authorize @task
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    if @task.update(task_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @task = Task.new(task_params)
    @task.project_id = @project.id
    authorize @task
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    authorize @task
    @task.destroy
    redirect_to tasks_path
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end
  def task_params
    params.require(:task).permit(:name, :completed)
  end
end
