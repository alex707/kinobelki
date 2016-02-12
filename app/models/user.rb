class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :user_avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :user_avatar, content_type: /\Aimage\/.*\Z/

  validates :usernick, :presence => true, :uniqueness => { :case_sensitive => true }

  validates_length_of :user_description, :maximum => 300
  has_many :projects
end
