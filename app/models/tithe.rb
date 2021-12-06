class Tithe < ApplicationRecord
  belongs_to :membership

  validates :membership_id, :tithe_date, presence: true
  validates :amount, presence: true, numericality: true
end
