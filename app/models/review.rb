class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  
  validates_length_of :review_pos, :maximum => 300
  validates_length_of :review_neg, :maximum => 300
end
