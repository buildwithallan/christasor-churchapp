require 'rails_helper'

RSpec.describe Membership, type: :model do
  
  describe "validations" do
  	it {is_expected.to validate_presence_of :firstname}
  	it {is_expected.to validate_presence_of :lastname}
  	it {is_expected.to validate_presence_of :gender}
  	it {is_expected.to validate_presence_of :member_id}
  	it {is_expected.to validate_uniqueness_of :member_id}
  end

  describe "associations" do
  	it {is_expected.to have_many(:tithes)}
  end
end
