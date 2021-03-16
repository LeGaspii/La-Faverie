class MigrateContenttoRichBodyProjects < ActiveRecord::Migration[6.0]
  def change
    def up
      project.find_each do |project|
        project.update(rich_body: project.body)
      end
    end
  
    def down
      Project.find_each do |project|
        project.update(body: project.rich_body)
        article.update(rich_body: nil)
      end
    end
  end
end
