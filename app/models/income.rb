class Income < ApplicationRecord
	validates :totaltithe, :totalpledge, :totaloffertory, :totalcontribution, presence: true, numericality: true
	validates :month_year, presence: true
	

	def total_income
		Income.where(id: id).sum('totaltithe + totaloffertory + totalcontribution + totalpledge')
	end
end
