class Genre < ActiveRecord::Base
	has_and_belongs_to_many :projects, dependent: :destroy
	has_and_belongs_to_many :users, dependent: :destroy
end
