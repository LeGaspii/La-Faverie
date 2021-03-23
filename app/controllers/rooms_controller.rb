class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :show, :destroy]
  def index
    @rooms = Room.all
  end

  def show
  end

  def new
  @room = Room.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def create
    @room = Room.new(room_params)
    @room.house = House.find(1)
    if @room.save!
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
    @room.destroy
    redirect_to rooms_path
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name)
  end
end
