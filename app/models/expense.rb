class Expense < ApplicationRecord
	validates :purpose, :expense_date, presence: true
	validates :amount, presence: true, numericality: true
end
