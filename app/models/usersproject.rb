class Usersproject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :date_start, :date_end, presence: true
end
