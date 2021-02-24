class DepartmentMember < ApplicationRecord
  belongs_to :department

  validates :name, presence: true
  validates :department_id, presence: true
end
