require 'rails_helper'

RSpec.describe "Groups", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /new" do
    it "returns http success" do
      get "/groups/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "will get all groups created" do
      get "/groups"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /groups" do
    it "creates a goup name" do
      post "/groups", params: {group: {group_name: "Jericho"}}

      result = Group.last
      expect(result.group_name).to eq("Jericho")
      expect(response).to redirect_to groups_path
    end
  end
end


