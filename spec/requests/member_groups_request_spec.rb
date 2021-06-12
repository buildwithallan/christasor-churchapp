require 'rails_helper'
  
RSpec.describe "MemberGroups", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /index" do
    it "returns http success" do
      get "/department_members"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/department_members/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /department_members" do
  
    let(:department){create(:department)}

    it "creates a new department member" do
      post '/department_members', params: {department_member: {name: 'Allan Aikins', department_id: department.id}}

      result = DepartmentMember.last
      expect(result.name).to eq('Allan Aikins')
      expect(response).to redirect_to department_members_path
    end
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
      expect(response).to redirect_to member_groups_path
    end
  end
end

