require 'rails_helper'

class User < ActiveRecord::Base
	has_many :words, :through => :users_words
	has_many :users_words
	has_many :speech_attempts

	# attr_accessible :email, :password_digest

	validates :email, presence: true
	validates :password_digest, presence: true

end
