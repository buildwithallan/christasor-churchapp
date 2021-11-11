class Department < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	has_many :department_members, dependent: :destroy

end
