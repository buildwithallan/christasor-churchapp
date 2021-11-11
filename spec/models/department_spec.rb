require 'rails_helper'

RSpec.describe Department, type: :model do
	
 describe "validations" do
  it {is_expected.to validate_presence_of :name}
  it {is_expected.to validate_uniqueness_of :name}
 end

 describe "association" do
 	it {is_expected.to have_many(:department_members)}
 end
end
