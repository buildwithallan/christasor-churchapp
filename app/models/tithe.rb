class Tithe < ApplicationRecord
  belongs_to :membership

  validates :membership_id, presence: true
  validates :amount, presence: true, numericality: true
  
end
