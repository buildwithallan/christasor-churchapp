class User < ApplicationRecord
	has_secure_password

	EMAIL_REGEX = /\A[^@\s]+@[^@\s]+\z/

	validates :email, presence: true, uniqueness: true, format: {with: EMAIL_REGEX }
	validates :user_type, presence: true
end
