class PerksController < ApplicationController
before_action :set_perk, only: [:edit, :update, :destroy]

  def new
  @room = Room.find(params[:room_id])
  @perk = Perk.new
  end

  def edit
    @perk = Perk.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
     @perk = Perk.find(params[:id])
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
    if @perk.save!
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
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

