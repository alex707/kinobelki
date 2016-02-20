class RenameReviewIdToProjectIdInReviews < ActiveRecord::Migration
  def change
    rename_column(:reviews, :review_id, :project_id)
  end
end
