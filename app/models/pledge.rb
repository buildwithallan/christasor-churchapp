class Pledge < ApplicationRecord
	validates :membername, :amount, :payment, :remarks, presence: true
end
