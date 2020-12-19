class Tithe < ApplicationRecord
	validates :amount, presence: true
end
