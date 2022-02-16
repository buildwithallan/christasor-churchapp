require 'rails_helper'

RSpec.describe "Dashboards", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

  describe "GET /index" do
    it "returns http success" do
     
      get "/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
