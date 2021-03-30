class FamilliesController < ApplicationController
  before_action :set_familly, only: [:edit, :update, :destroy]

  def new
  @user = user.find(params[:user_id])
  @familly = Familly.new
  authorize @familly
  end

  def edit
    @familly = Familly.find(params[:id])
    authorize @familly
  end

  def update
    @room = Room.find(params[:room_id])
    authorize @familly
    if @familly.update(familly_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @familly = Familly.new(familly_params)
    @familly.user_id = current_user.id
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
