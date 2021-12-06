class Contribution < ApplicationRecord
	validates :name, :purpose, :contribution_date, presence: true
	validates :amount, presence: true, numericality: true
end
