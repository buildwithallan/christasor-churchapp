class Membership < ApplicationRecord
	extend FriendlyId
    friendly_id :firstname, use: :slugged
	
	validates :firstname, :lastname, :gender, presence: true
	validates :member_id, presence: true, uniqueness: true


	has_one_attached :image

	has_many :tithes, dependent: :destroy

end
