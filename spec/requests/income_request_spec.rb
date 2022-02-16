require 'rails_helper'

RSpec.describe "Incomes", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let(:valid_params) do {
 income: {
 	totaltithe: 15000,
 	totalpledge: 3000,
 	totalcontribution: 1000,
 	totaloffertory: 12000,
 	month_year: "2021/09/30"
 }
}
end

let(:invalid_params) do {
 income: {
 	totaltithe: nil,
 	totalpledge: 3000,
 	totalcontribution: 1000,
 	totaloffertory: 12000,
 	month_year: "2021/09/30"
 }
}
end

  describe "GET /index" do
    it "displays all incomes created" do
      get incomes_path
      expect(response).to be_successful
    end
  end

   describe "GET /new" do
    it "renders a successful response" do
      get new_income_path
      expect(response).to be_successful
    end
  end

  describe "POST /incomes" do
    it "creates a new income" do
      post incomes_path, params: valid_params

      result = Income.first
      expect(result.totaltithe).to eq(15000)
      expect(response).to redirect_to incomes_path
    end
    it "doesn't create a new income" do
      post incomes_url, params: invalid_params
      expect(response).not_to redirect_to incomes_path
    end
  end

end
