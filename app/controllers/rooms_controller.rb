class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    allusers = User.all
    @users = allusers.reject do |user|
      user.reservations.any? do |reservation|
        reservation.room == @room
      end
    end
  end

  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
