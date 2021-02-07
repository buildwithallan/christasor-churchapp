class Contribution < ApplicationRecord

	validates :name, presence: true
	validates :amount, presence: true, numericality: true
	validates :purpose, presence: true

  ransacker :created_at, type: :date do
   Arel.sql('date(created_at)')
  end
  
end
