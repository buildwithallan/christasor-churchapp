class Expense < ApplicationRecord
	validates :purpose, presence: true
	validates :amount, presence: true, numericality: true
	validates :expense_date, presence: true
end
