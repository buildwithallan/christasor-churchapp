require 'rails_helper'

RSpec.describe "DepartmentMembers", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/department_members/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/department_members/new"
      expect(response).to have_http_status(:success)
    end
  end

end
