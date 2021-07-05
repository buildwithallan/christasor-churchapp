class Department < ApplicationRecord
	has_many :department_members
	
	validates :name, presence: true

end
