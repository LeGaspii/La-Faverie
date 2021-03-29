class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :perks
  validates :date_in, :date_out, presence: true

  validate :no_reservation_overlap

   scope :overlapping, ->(period_start, period_end) do
      where "((date_in <= ?) and (date_out >= ?))", period_end, period_start
   end

private

  def room_reservation
    Reservation.where(room_id: self.room_id)
  end

  def no_reservation_overlap
    if (room_reservation.overlapping(date_in, date_out).any?)
       errors.add(:date_out, 'Les dates chevauchent une reservations existantes !!')
    end
  end

end
