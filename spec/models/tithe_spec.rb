require 'rails_helper'

RSpec.describe Tithe, type: :model do

  describe "validations" do
  	it {is_expected.to validate_presence_of :membership_id}
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_numericality_of :amount}
  end

  describe "associations" do
  	it {is_expected.to belong_to(:membership)}
  end
end
