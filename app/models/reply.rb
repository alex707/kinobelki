class Reply < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	validates :reply, :presence => true
end
