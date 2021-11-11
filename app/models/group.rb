class Group < ApplicationRecord
	validates :group_name, presence: true, uniqueness: true

	has_many :member_groups, dependent: :destroy
end
