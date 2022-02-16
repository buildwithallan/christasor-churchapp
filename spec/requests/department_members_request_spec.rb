require 'rails_helper'

RSpec.describe "DepartmentMembers", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let!(:department){create(:department)}

let(:valid_params)do {
  department_member: {
    name: 'Allan Aikins', 
    department_id: department.id
  }
}
end

let(:invalid_params)do {
  department_member: {
    name: '', 
    department_id: department.id
  }
}
end


  describe "GET /index" do
    let(:department_member){create(:department_member)}

    it "displays all department members created" do
      get department_members_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_department_member_path
      expect(response).to be_successful
    end
  end

    describe "GET /edit" do
    let(:department_member){create(:department_member)}

    it "renders a successful response" do
      get edit_department_member_path(department_member)
      expect(response).to be_successful
    end
  end

   describe "PATCH /update" do
   let(:department_member){create(:department_member)}

    it "updates a member" do
      patch department_member_path(department_member), params: valid_params
      expect(response).to redirect_to department_members_path
    end
     it "doesn't update a member" do
      patch department_member_path(department_member), params: invalid_params
      expect(response).not_to redirect_to department_members_path
    end
  end

  describe "POST /department_members" do

    it "creates a new department member" do
      post department_members_path, params: valid_params 

      result = DepartmentMember.last
      expect(result.name).to eq('Allan Aikins')
      expect(response).to redirect_to department_members_path
    end
    it "doesn't create a new department member" do
      post department_members_path, params: invalid_params
      expect(response).not_to redirect_to department_members_path 
    end
  end

  describe "DELETE /destroy" do
   let(:department_member){create(:department_member)}
   
    it "deletes a group member" do
      delete department_member_path(department_member)
      expect(response).to redirect_to department_members_path
    end
  end

end
