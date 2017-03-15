class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, :email, :password, presence:true 
	validates :email, :password, length: {minimum: 4}
	validates :name, length: {minimum:2}
	validates :email, uniqueness:{case_sensitive:false}, format: {with:EMAIL_REGEX}
end
