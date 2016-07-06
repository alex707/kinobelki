class AddBodyUserIdAndProjectIdToAchievements < ActiveRecord::Migration
  def change
		add_column :achievements, :body, :text
		add_reference :achievements, :user_id, index: true, foreign_key: true
		add_reference :achievements, :project_id, index: true, foreign_key: true
  end
end
