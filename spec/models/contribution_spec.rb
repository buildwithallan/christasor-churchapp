require 'rails_helper'

RSpec.describe Contribution, type: :model do
  
  describe "validations" do
  	it {is_expected.to validate_presence_of :name}
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_presence_of :purpose}
  	it {is_expected.to validate_presence_of :contribution_date}
  	it {is_expected.to validate_numericality_of :amount}
  end
end
