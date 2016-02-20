class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true
      t.text :review_pos
      t.text :review_neg
      t.datetime :published_at
      t.timestamps null: false
    end
  end
end
