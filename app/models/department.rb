class Department < ApplicationRecord
	validates :name, presence: true

	has_many :department_members
end
