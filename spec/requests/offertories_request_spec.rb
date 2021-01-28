require 'rails_helper'

RSpec.describe "Offertories", type: :request do

  before do
    user = FactoryBot.create(:user)
    sign_in user
   end

  describe "GET /index" do
    it "displays all offertories created" do
      get "/offertories"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/offertories/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /offertories" do
    it "creates an offertory" do
      post "/offertories", params: {offertory: {amount: 150, description: "Sunday 1st Service"}}

      result = Offertory.last
      expect(result.amount).to eq(150)
      expect(response).to redirect_to(:action => :index)
    end
  end

end
