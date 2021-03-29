class Room < ApplicationRecord
  belongs_to :house
  has_many :reservations
  validates :name, presence: true


end
