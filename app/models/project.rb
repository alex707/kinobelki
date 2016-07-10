class Project < ActiveRecord::Base

  has_attached_file :project_avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :project_avatar, content_type: /\Aimage\/.*\Z/

  validates_length_of :project_description, :maximum => 300
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
	has_many :achievements, dependent: :destroy
	has_and_belongs_to_many :genres
	has_and_belongs_to_many :skills
	has_one :city
end
