require 'rails_helper'

RSpec.describe DepartmentMember, type: :model do
  
  describe "validations" do
 	it {is_expected.to validate_presence_of :name}
 	it {is_expected.to validate_presence_of :department_id}
 end

 describe "associations" do
 	it {is_expected.to belong_to(:department)}
 end
end
