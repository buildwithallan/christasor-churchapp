class Membership < ApplicationRecord
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :gender, presence: true
	validates :primary_phone_number, presence: true
	validates :title, presence: true
end
