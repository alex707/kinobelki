class Comment < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates_length_of :body, :maximum => 300
end


