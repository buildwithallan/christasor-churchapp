require 'rails_helper'

RSpec.describe "Pledges", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /new" do
    it "returns http success" do
      get "/pledges/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/pledges"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /pledges" do
    it "creates a pledge" do
      post "/pledges", params: {pledge: {membername: 'Nana Appiah', amount: 200, payment: 'paid', remarks: 'pledge for generator'}}

      result = Pledge.last
      expect(result.payment).to eq('paid')
      expect(response).to redirect_to pledges_path
    end
  end

end
