require 'rails_helper'

RSpec.describe Pledge, type: :model do
  describe "validations" do
  	it {is_expected.to validate_presence_of :membername}
  	it {is_expected.to validate_presence_of :amount}
  	it {is_expected.to validate_presence_of :payment}
  	it {is_expected.to validate_presence_of :remarks}
  end
end
