class CreateJoinTableSkillProject < ActiveRecord::Migration
  def change
    create_join_table :skills, :projects do |t|
      # t.index [:skill_id, :project_id]
      # t.index [:project_id, :skill_id]
    end
  end
end
