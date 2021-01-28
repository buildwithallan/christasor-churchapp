require 'rails_helper'

RSpec.describe Expense, type: :model do
	
  describe "validations" do
  	it {is_expected.to validate_presence_of :purpose}
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_numericality_of :amount}
  	it {is_expected.to validate_presence_of :expense_date}
  end
end
