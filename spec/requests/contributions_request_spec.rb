require 'rails_helper'

RSpec.describe "Contributions", type: :request do

  before do
    user = FactoryBot.create(:user)
    sign_in user
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
      expect(response).to redirect_to(:action => :index)
    end 
  end

end
