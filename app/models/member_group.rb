class MemberGroup < ApplicationRecord
  belongs_to :group

  validates :fullname, presence: true
  validates :group_id, presence: true
end
