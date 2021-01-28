class Offertory < ApplicationRecord
	validates :amount, presence: true, numericality: true
	validates :description, presence: true

end
