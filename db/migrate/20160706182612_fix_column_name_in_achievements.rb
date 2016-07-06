class FixColumnNameInAchievements < ActiveRecord::Migration
  def change
		rename_column :achievements, :user_id_id, :user_id
		rename_column :achievements, :project_id_id, :project_id
  end
end
