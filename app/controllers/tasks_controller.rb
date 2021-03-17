class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]

  def new
  @project = Project.find(params[:project_id])
  @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:id])
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
    if @task.save
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
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
