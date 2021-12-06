class Pledge < ApplicationRecord
	validates :membername, :payment, :pledge_date, :remarks, presence: true
	validates :amount, presence: true, numericality: true
end
