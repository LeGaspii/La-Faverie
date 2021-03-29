class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def new
  authorize @reservation
  @reservation = Reservation.find(params[:room_id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def update
    @room = Room.find(params[:room_id])
    authorize @reservation
    if @reservation.update(reservation_params)
      redirect_to room_path(@room)
    else
      render :edit
    end
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @reservation.room_id = @room.id
    authorize @reservation
    if @reservation.save
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  def destroy
    authorize @reservation
    @reservation.destroy
    redirect_to rooms_path
  end

  private
  def set_reservation
    @reservation = reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:date_in, :date_out)
  end
end
