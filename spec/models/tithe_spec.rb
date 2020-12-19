require 'rails_helper'

RSpec.describe Tithe, type: :model do
  describe "validations" do
  	it {is_expected.to validate_presence_of :amount}
  end
end
