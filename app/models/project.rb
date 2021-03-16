class Project < ApplicationRecord
  belongs_to :house
  has_one_attached :photo
  has_rich_text :rich_body
  has_many :tasks
  has_many :buyings
  has_many :usersprojects
  validates :name, presence: true
end
