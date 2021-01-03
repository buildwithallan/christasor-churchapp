class Membership < ApplicationRecord
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :gender, presence: true
	validates :title, presence: true

	has_one_attached :image

	has_many :tithes

end
