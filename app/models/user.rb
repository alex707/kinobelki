class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :user_avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :user_avatar, content_type: /\Aimage\/.*\Z/

  validates :user_nickname, :presence => true, :uniqueness => { :case_sensitive => true }

  validates_length_of :user_description, :maximum => 300
  has_many :projects
  has_many :reviews

  belongs_to :role

	def admin?
		if self != nil
		if self.role != nil
			logger.debug "role: #{self.role.name}"
			self.role.name == "admin"
		end
		end
	end

	def user?
		if self != nil
		if self.role != nil
			logger.debug "role #{self.role.name}"
			self.role.name == "user"
		end
		end
	end
end
