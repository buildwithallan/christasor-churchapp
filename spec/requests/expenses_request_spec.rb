require 'rails_helper'

RSpec.describe "Expenses", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

let(:valid_params) do{
  expense: {
    purpose: "Electricity", 
    amount: 150, 
    expense_date: "2021/11/21"
  }
}
end

let(:invalid_params) do{
  expense: {
    purpose: "", 
    amount: 150, 
    expense_date: "2021/11/21"
  }
}
end

  describe "GET /index" do
    it "displays all expenses" do
      get expenses_url
      expect(response).to be_successful
    end
  end

   describe "GET /new" do
    it "renders a successful response" do
      get new_expense_url
      expect(response).to be_successful
    end
  end

  describe "POST /expenses" do
    it "creates a new expenses" do
      post expenses_url, params: valid_params

      result = Expense.first
      expect(result.purpose).to eq('Electricity')
      expect(response).to redirect_to expenses_url
    end
    it "doesn't create a new expense" do
      post expenses_url, params: invalid_params 
      expect(response).not_to redirect_to expenses_url
    end
  end

end
