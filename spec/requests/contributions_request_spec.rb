require 'rails_helper'

RSpec.describe "Contributions", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /new" do
    it "returns http success" do
      get "/contributions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "will get all contributions created" do
      get "/contributions"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /contributions" do

    it "creates a new contribution" do
      post "/contributions", params: {contribution: {name: "Allan Aikins", amount: 200.0, purpose: "harvest"}}

      result = Contribution.last
      expect(result.name).to eq("Allan Aikins")
      expect(response).to redirect_to contributions_path
    end 
  end

end
