class UsersprojectsController < ApplicationController
  before_action :set_usersproject, only: [:edit, :update, :destroy]

  def new
  @usersproject = Usersproject.find(params[:project_id])
  end

  def edit
    @usersproject = Usersproject.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    if @usersproject.update(usersproject_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @usersproject = Usersproject.new(usersproject_params)
    @usersproject.user_id = current_user.id
    @usersproject.project_id = @project.id
    if @usersproject.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    @usersproject.destroy
    redirect_to usersprojects_path
  end

  private
  def set_usersproject
    @usersproject = Userproject.find(params[:id])
  end

  def usersproject_params
    params.require(:usersproject).permit(:date_start, :date_end)
  end
end
