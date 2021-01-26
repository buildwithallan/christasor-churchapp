require 'rails_helper'

RSpec.describe MemberGroup, type: :model do

 describe "validations" do
 	it {is_expected.to validate_presence_of :fullname}
 	it {is_expected.to validate_presence_of :group_id}
 end

 describe "associations" do
 	it {is_expected.to belong_to(:group)}
 end

end
