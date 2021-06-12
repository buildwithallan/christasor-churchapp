require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "#create" do
  	context "when user is logged in" do
  	 it "loads correct user details and redirects to root path" do
  	 	user = User.create(email: 'admin@admin.com', password: 'password')
  	  post "/login", params: {email: user.email}
  	  expect(user.email).to eq('admin@admin.com')
      expect(session[:user_id]).to eq(user.id)
  	 end
    end
  end

end
