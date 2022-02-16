require 'rails_helper'

RSpec.describe "Contributions", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let(:valid_params) do{
  contribution: {
    name: "Allan Aikins", 
    amount: 200.0, 
    purpose: "harvest",
    contribution_date: "2021/11/21"
  }
}
end

let(:invalid_params) do{
  contribution: {
    name: "Allan Aikins", 
    amount: nil, 
    purpose: "harvest",
    contribution_date: "2021/11/21"
  }
}
end

  describe "GET /index" do
   let(:contributions){create(:contributions)}

    it "will get all contributions created" do
      get contributions_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_contribution_path
      expect(response).to be_successful
    end
  end


  describe "POST /contributions" do

    it "creates a new contribution" do
      post contributions_path, params: valid_params

      result = Contribution.last
      expect(result.name).to eq("Allan Aikins")
      expect(response).to redirect_to contributions_path
    end 
    it "doesn't create a new contribution" do
       post contributions_path, params: invalid_params
       expect(response).not_to redirect_to contributions_path
    end
  end
end
