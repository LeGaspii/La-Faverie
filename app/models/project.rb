class Project < ApplicationRecord
  belongs_to :house
  has_one_attached :photo, dependent: :destroy
  has_rich_text :rich_body
  has_many :tasks, dependent: :destroy
  has_many :buyings, dependent: :destroy
  has_many :usersprojects, dependent: :destroy
  has_many :comments, dependent: :destroy
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

  def project_task_count
    Task.where(project_id: self).count
  end

  def project_task
    Task.where(project_id: self)
  end

  def project_task_completed
    project_task.where(completed: true).count
  end

  def project_advancement
    project_task_completed.fdiv(project_task_count) * 100
  end

  def day_until_end
    (Date.today - self.deadline).round
  end
end
