class Blog < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_many_attached :photos
  validates :title, presence: true
  validates :content, presence: true
  end
