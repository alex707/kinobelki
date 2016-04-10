class RenameProjectsIdToProjectIdInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :projects_id, :project_id
  end
end
