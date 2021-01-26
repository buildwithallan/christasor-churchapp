require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "validations" do
  	it {is_expected.to validate_presence_of :group_name}
  end

  describe "association" do
  	it {is_expected.to have_many(:member_groups)}
  end
end
