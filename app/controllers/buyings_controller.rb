class BuyingsController < ApplicationController
  before_action :set_buying, only: [:edit, :update, :destroy]

  def new
  @project = Project.find(params[:project_id])
  @buying = Buying.new
  authorize @buying
  end

  def edit
    authorize @buying
    @buying = Buying.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @buying = Buying.find(params[:id])
    authorize @buying
    if @buying.update(buying_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def create
    @project = Project.find(params[:project_id])
    @buying = Buying.new(buying_params)
    @buying.project_id = @project.id
    authorize @buying
    if @buying.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def destroy
    authorize @buying
    @buying.destroy
    redirect_to buyings_path
  end

  private
  def set_buying
    @buying = Buying.find(params[:id])
  end
  def buying_params
    params.require(:buying).permit(:name, :number, :value)
  end
end
