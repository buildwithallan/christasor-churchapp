class Branch < ApplicationRecord
	validates :district, presence: true
	validates :location, presence: true
	validates :contact1, presence: true
end
