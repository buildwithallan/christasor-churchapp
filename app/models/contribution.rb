class Contribution < ApplicationRecord

	validates :name, presence: true
	validates :amount, presence: true, numericality: true
	validates :purpose, presence: true
end
