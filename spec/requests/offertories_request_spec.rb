require 'rails_helper'

RSpec.describe "Offertories", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let(:valid_params) do{
  offertory: { 
    description: "Sunday 1st Service",
    amount: 150,
    offertory_date: "2021/11/21"
  }
}
end

let(:invalid_params) do{
  offertory: { 
    description: "",
    amount: 150,
    offertory_date: "2021/11/21"
  }
}
end
  describe "GET /index" do
   let(:offertories){create(:offertories)}

    it "displays all offertories created" do
      get offertories_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_offertory_path
      expect(response).to be_successful
    end
  end

  describe "POST /offertories" do
    it "creates a new offertory" do
      post offertories_path, params: valid_params

      result = Offertory.first
      expect(result.amount).to eq(150)
      expect(response).to redirect_to offertories_path
    end
    it "doesn't create a new offertory" do
      post offertories_path, params: invalid_params
      expect(response).not_to redirect_to offertories_path
    end
  end

end
