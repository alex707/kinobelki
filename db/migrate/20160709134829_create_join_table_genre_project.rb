class CreateJoinTableGenreProject < ActiveRecord::Migration
  def change
    create_join_table :genres, :projects do |t|
      # t.index [:genre_id, :project_id]
      # t.index [:project_id, :genre_id]
    end
  end
end
