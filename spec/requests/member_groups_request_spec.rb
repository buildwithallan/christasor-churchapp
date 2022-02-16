require 'rails_helper'
  
RSpec.describe "MemberGroups", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let!(:group){create(:group)}

let(:valid_params) do{
  member_group: {
    fullname: 'Allan Aikins', 
    group_id: group.id
  }
}
end

let(:invalid_params) do{
  member_group: {
    fullname: '', 
    group_id: group.id
  }
}
end


  describe "GET /index" do
    let(:member_group){create(:member_group)}

    it "displays all group members created" do
      get member_groups_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_member_group_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:member_group){create(:member_group)}

    it "renders a successful response" do
      get edit_member_group_path(member_group)
      expect(response).to be_successful
    end
  end

   describe "PATCH /update" do
   let(:member_group){create(:member_group)}

    it "updates a member" do
      patch member_group_path(member_group), params: valid_params
      expect(response).to redirect_to member_groups_path
    end
     it "doesn't update a member" do
      patch member_group_path(member_group), params: invalid_params
      expect(response).not_to redirect_to member_groups_path
    end
  end

  describe "POST /member_groups" do  
    it "creates a new membergroup" do
      post member_groups_path, params: valid_params

      result = MemberGroup.last
      expect(result.fullname).to eq('Allan Aikins')
      expect(response).to redirect_to member_groups_path
    end
    it "doesn't create a new group member" do
      post member_groups_path, params: invalid_params
      expect(response).not_to redirect_to member_groups_path
    end
  end

  describe "DELETE /destroy" do
   let(:member_group){create(:member_group)}
   
    it "deletes a group member" do
      delete member_group_path(member_group)
      expect(response).to redirect_to member_groups_path
    end
  end
end

