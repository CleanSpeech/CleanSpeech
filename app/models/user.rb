
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

	has_many :words, :through => :users_words
	has_many :users_words
	has_many :speech_attempts

  attr_accessor :email, :password

	# attr_accessible :email, :password_digest

	validates :email, presence: true, uniqueness: true
	# validates :password, presence: true

  def self.from_omniauth(auth)
    if !where(email: auth.info.email).empty?
      user = where(email: auth.info.email).first
      user.uid = auth.uid          
      user.save!
      user
    else
      where(uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
    end
  end
  
end
end
