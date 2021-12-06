class Offertory < ApplicationRecord
	validates :amount, presence: true, numericality: true
	validates :description, :offertory_date, presence: true
end
