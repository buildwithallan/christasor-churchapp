class Membership < ApplicationRecord
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	

	has_one_attached :image

	has_many :tithes

end
