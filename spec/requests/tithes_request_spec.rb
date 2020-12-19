require 'rails_helper'

RSpec.describe "Tithes", type: :request do

  describe "GET /index" do
    it "will get all tithes paid" do
      get "/tithes"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/tithes/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /tithes" do
    it "creates a tithe" do
      post "/tithes", params: {tithe: {amount: 200}}

      result = Tithe.last
      expect(result.amount).to eq(200)
      expect(response).to redirect_to(:action => :index)
    end 
  end

end
