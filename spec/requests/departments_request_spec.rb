require 'rails_helper'

RSpec.describe "Departments", type: :request do


   before do
    user = FactoryBot.create(:user)
    sign_in user
   end

  describe "GET /index" do
    it "will get all departments created" do
      get "/departments"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
     let(:department){create(:department)}

    it "updates a department" do
      get edit_department_path(department), params: {id: department.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/departments/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /departments" do
    it "creates a new department" do
      post "/departments", params: {department: {name: 'Media'}}

      result = Department.last
      expect(result.name).to eq('Media')
      expect(response).to redirect_to(:action => :index)
    end
  end

  describe "DELETE /departments/:id" do
    let(:department){create(:department)}

    it "deletes a department" do
      delete department_path(department), params: {id: department.id}
      expect(response).to redirect_to departments_path
    end
  end
end

