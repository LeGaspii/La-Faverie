class RoomsController < ApplicationController
  before_action :set_room, only: [:edit, :update, :show, :destroy]
  def index
    @rooms = policy_scope(Room.all)
  end

  def show
    authorize @room
    @reservation = Reservation.new
    @reservations = Reservation.where(room_id: @room)
  end

  def new
  @room = Room.new
    authorize @room
  end

  def edit
    authorize @room
    @room = Room.find(params[:id])
  end

  def update
    authorize @room
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
    authorize @room
    if @room.save!
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
    authorize @room
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
