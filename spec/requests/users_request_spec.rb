require 'rails_helper'

RSpec.describe "Users", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do

    it "creates a new user" do
      post "/users", params: {user: {email: 'admin@admin.com', password: 'admin1234', password_confirmation: 'admin1234', user_type: 'Admin'}}

      result = User.last
      expect(result.email).to eq('admin@admin.com')
      expect(session[:user_id]).to eq(result.id)
    end
  end

end
