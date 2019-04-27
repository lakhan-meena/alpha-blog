class User < ApplicationRecord
	has_secure_password
	validates :full_name, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false},
	format: {with: VALID_EMAIL_REGEX}
	has_many :articles
	before_save {self.email = email.downcase}
end
