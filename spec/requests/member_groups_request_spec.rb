require 'rails_helper'


  
RSpec.describe "MemberGroups", type: :request do

   before do
    user = FactoryBot.create(:user)
    sign_in user
   end

  describe "GET /index" do
    it "returns http success" do
      get "/member_groups"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/member_groups/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /member_groups" do
  
    let(:group){create(:group)}

    it "creates a new membergroup" do
      post '/member_groups', params: {member_group: {fullname: 'Allan Aikins', group_id: group.id}}

      result = MemberGroup.last
      expect(result.fullname).to eq('Allan Aikins')
      expect(response).to redirect_to(:action => :index)
    end
  end
end

