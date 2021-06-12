require 'rails_helper'

RSpec.describe "Incomes", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /index" do
    it "returns http success" do
      get "/incomes"
      expect(response).to have_http_status(:success)
    end
  end

end
