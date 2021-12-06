class Membership < ApplicationRecord
	extend FriendlyId
    friendly_id :firstname, use: :slugged

	validates :member_id, presence: true, uniqueness: true
	validates :firstname, :lastname, :gender, presence: true

	has_one_attached :image
	has_many :tithes, dependent: :destroy

end
