class AddProjectToComments < ActiveRecord::Migration[6.0]
  def change
     remove_column :comments, :blog_id
    add_reference :comments, :project, null: false, foreign_key: true
  end
end
