class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :blog
  has_rich_text :rich_body
  validates :rich_body, presence: true
end
