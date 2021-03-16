class Income < ApplicationRecord
	validates :totaltithe, presence: true, numericality: true
	validates :totaloffertory, presence: true, numericality: true

	def total_income
		Income.where(id: id).sum('totaltithe + totaloffertory + totalcontribution + totalpledge')
	end
end
