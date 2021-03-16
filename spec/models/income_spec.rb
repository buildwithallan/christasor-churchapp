require 'rails_helper'

RSpec.describe Income, type: :model do
	
  describe "validations" do
  	it {is_expected.to validate_presence_of :totaltithe}
  	it {is_expected.to validate_presence_of :totaloffertory}
  	it {is_expected.to validate_numericality_of :totaltithe}
  	it {is_expected.to validate_numericality_of :totaloffertory}
  end
end
