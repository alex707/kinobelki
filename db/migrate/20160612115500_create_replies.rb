class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
			t.belongs_to :user, index: true
			t.belongs_to :project, index: true
			t.integer

      t.timestamps null: false
    end
  end
end
