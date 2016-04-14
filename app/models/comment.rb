class Comment < ActiveRecord::Base
  belongs_to :projects

  validates :commenter, presence: true 
  validates_length_of :body, :maximum => 300
end


