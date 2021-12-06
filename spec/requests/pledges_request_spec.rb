require 'rails_helper'

RSpec.describe "Pledges", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

let(:valid_params) do {
  pledge: {
    membername: 'Nana Appiah', 
    amount: 200, 
    payment: 'paid', 
    remarks: 'pledge for the purchasing of a generator',
    pledge_date: '2021/11/21'
  }
}
end

let(:invalid_params) do {
  pledge: {
    membername: '', 
    amount: 200, 
    payment: 'paid', 
    remarks: 'pledge for the purchasing of a generator',
    pledge_date: '2021/11/21'
  }
}
end

  describe "GET /index" do
   let(:pledge){create(:pledge)}
    it "displays all pledges created" do
      get pledges_url
      expect(response).to be_successful
    end
  end

   describe "GET /new" do
    it "renders a successful response" do
      get new_pledge_url
      expect(response).to be_successful
    end
  end

  describe "POST /pledges" do
    it "creates a new pledge" do
      post pledges_url, params: valid_params

      result = Pledge.last
      expect(result.payment).to eq('paid')
      expect(response).to redirect_to pledges_url
    end
  end
  it "doesn't create a new pledge" do
    post pledges_url, params: invalid_params
    expect(response).not_to redirect_to pledges_url
  end
end
