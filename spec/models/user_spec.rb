require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
  	subject { FactoryBot.build(:user) }
  	it {is_expected.to validate_presence_of :email}
  	it {is_expected.to validate_uniqueness_of (:email)}	
  	it {is_expected.to have_secure_password}
  	it {is_expected.to validate_presence_of :user_type}
  end
end
