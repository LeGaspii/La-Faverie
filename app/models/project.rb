class Project < ApplicationRecord
  belongs_to :house
  has_many_attached :photos
  has_many :tasks
  has_many :buyings
  has_many :usersprojects
  validates :name, presence: true
  validates :content, presence: true
end
