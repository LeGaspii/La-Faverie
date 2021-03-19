class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :usersfamillies
  has_many :blogs
  has_many :comments
  has_many :usersprojects, dependent: :destroy
  has_many :reservations, dependent: :destroy
  validates :photo, presence: true
end
