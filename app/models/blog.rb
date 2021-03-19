class Blog < ApplicationRecord
  belongs_to :house
  belongs_to :user
  has_many_attached :photos
  has_rich_text :rich_body
  validates :title, presence: true
  validates :photos, presence: true
  validates :rich_body, presence: true
end
