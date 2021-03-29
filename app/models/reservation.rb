class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :perks
  validates_presence_of :date_in, :date_out

# Check if a given interval overlaps this interval
# def overlaps?(other)
#   date_in <= other.date_out && other.date_in <= date_out
# end
#
# # Return a scope for all interval overlapping the given interval, excluding the given interval itself
# scope :overlapping, -> { |interval|
#   where("id <> ? AND date_in <= ? AND ? <= date_out", interval.id, interval.date_out, interval.date_in)
# }

end
