class Offertory < ApplicationRecord
	validates :amount, presence: true, numericality: true
	validates :description, presence: true

	ransacker :created_at, type: :date do
     Arel.sql('date(created_at)')
    end
end
