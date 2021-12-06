require 'rails_helper'

RSpec.describe Offertory, type: :model do
  
  describe "validations" do
  	it {is_expected.to validate_presence_of :description}  	
  	it {is_expected.to validate_presence_of :offertory_date}  	
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_numericality_of :amount}
  end
end
