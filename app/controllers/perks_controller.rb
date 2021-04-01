class PerksController < ApplicationController
  before_action :set_perk, only: [:edit, :update, :destroy]

  def new
    @perk = Perk.new
    authorize @perk
  end

  def edit
    @perk = Perk.find(params[:id])
    authorize @perk
  end

  def update
    @room = Room.find(params[:room_id])
    @perk = Perk.find(params[:id])
    authorize @perk
    if @perk.update(perk_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @perk = Perk.new(perk_params)
    @perk.room_id = @room.id
    authorize @perk
    if @perk.save!
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
    authorize @perk
    @perk.destroy
    redirect_to rooms_path
  end

  private

  def set_perk
    @perk = Perk.find(params[:id])
  end

  def perk_params
    params.require(:perk).permit(:name, :number)
  end
end
