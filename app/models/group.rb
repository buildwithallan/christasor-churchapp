class Group < ApplicationRecord
	validates :group_name, presence: true

	has_many :member_groups
end
