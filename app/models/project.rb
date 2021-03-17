class Project < ApplicationRecord
  belongs_to :house
  has_one_attached :photo
  has_rich_text :rich_body
  has_many :tasks
  has_many :buyings
  has_many :usersprojects
  validates :name, presence: true
  validates :photo, presence: true

  def value_project
    buying_value = Buying.where(project_id: self)
      sum = 0
      buying_value.each do |buying|
        sum += (buying.number * buying.value)
      end
    sum
  end

end
