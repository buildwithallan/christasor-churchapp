require 'rails_helper'

RSpec.describe "Tithes", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

 let!(:membership){create(:membership)}

 let(:valid_params) do {
   tithe: {
    membership_id: membership.id, 
    amount: 200.00,
    tithe_date: "2021/11/23"
  }
 }
end

let(:invalid_params) do {
   tithe: {
    membership_id: nil, 
    amount: 200.00,
    tithe_date: "2021/11/23"
  }
 }
end
  describe "GET /index" do
   let(:tithe){create(:tithe)}

    it "displays all tithes created" do
      get tithes_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tithe_url
      expect(response).to be_successful
    end
  end

  describe "POST /tithes" do
    it "creates a new tithe" do
      post tithes_url, params: valid_params

      result = Tithe.first
      expect(result.amount).to eq(200.00)
      expect(response).to redirect_to tithes_url
    end
    it "doesn't create a new tithe" do
      post tithes_url, params: invalid_params
      expect(response).not_to redirect_to tithes_url
    end
  end
end

