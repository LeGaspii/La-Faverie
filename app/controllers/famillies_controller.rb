class FamilliesController < ApplicationController
  before_action :set_familly, only: [:edit, :update, :destroy]

  def new
  @familly = Familly.new
  authorize @familly
  end

  def edit
    @familly = Familly.find(params[:id])
    authorize @familly
  end

  def update
    @familly = Familly.find(params[:room_id])
    authorize @familly
    if @familly.update(familly_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def create
    @familly = Familly.new(familly_params)
    @familly.user_id = current_user.id
    @familly.name = current_user.last_name
        @familly.address = current_user.address
    authorize @familly
    if @familly.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    authorize @familly
    @familly.destroy
    redirect_to rooms_path
  end

  private
  def set_familly
    @familly = familly.find(params[:id])
  end

  def familly_params
    params.require(:familly).permit(:name, :address, :nom, :prenom)
  end
end
