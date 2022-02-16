require 'rails_helper'

RSpec.describe "Users", type: :request do

before do
  current_user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: current_user.email, password: current_user.password}
end

let(:valid_params) do {
  user: {
    email: 'admin11@admin.com',
     password: 'admin1234', 
     password_confirmation: 'admin1234',
      user_type: 'Admin'
    }
}
end

let(:invalid_params) do {
  user: {
    email: '',
     password: 'admin1234', 
     password_confirmation: 'admin1234',
      user_type: 'Admin'
    }
}
end

  describe "GET /index" do
    let(:user){create(:user)}

    it "displays all users created" do
      get users_path
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successfull response" do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:user){create(:user)}

    it "renders a successful response" do
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:user){create(:user)}

    it "updates a user" do
      patch user_path(user), params: valid_params
      expect(response).to redirect_to users_path
    end
    it "doesn't update a department" do
      patch user_path(user), params: invalid_params
      expect(response).not_to redirect_to users_path
    end
  end


  describe "POST /create" do
    it "creates a new user" do
      post users_path, params: valid_params

      result = User.last
      expect(result.email).to eq('admin11@admin.com')
      expect(session[:user_id]).to eq(result.id)
      expect(response).to redirect_to users_path
    end
    it "doesn't create a new user" do
      post users_path, params: invalid_params
      expect(response).not_to redirect_to users_path
    end
  end

   describe "DELETE /destroy" do
    let(:user){create(:user)}

    it "deletes a user" do
      delete user_path(user)
      expect(response).to redirect_to users_path
    end
  end
end
