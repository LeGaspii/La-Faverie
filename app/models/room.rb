class Room < ApplicationRecord
  belongs_to :house
  has_many :reservations
  validates :name, presence: true

  def unavailable_dates
    reservations.pluck(:date_in, :date_out).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
