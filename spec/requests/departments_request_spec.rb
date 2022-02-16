require 'rails_helper'

RSpec.describe "Departments", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end

let(:valid_params) do {
 department: {
  name: "Media"
 }
}
end

let(:invalid_params) do {
 department: {
  name: ""
 }
}
end

  describe "GET /index" do
    let(:department){create(:department)}

    it "displays all departments created" do
      get departments_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:department){create(:department)}

    it "renders a successful response" do
      get edit_department_path(department)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:department){create(:department)}

    it "updates a department" do
      patch department_path(department), params: valid_params
      expect(response).to redirect_to departments_url
    end
    it "doesn't update a department" do
      patch department_path(department), params: invalid_params
      expect(response).not_to redirect_to departments_path
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_department_path
      expect(response).to be_successful
    end
  end

  describe "POST /departments" do
    it "creates a new department" do
      post departments_path, params: valid_params

      result = Department.last
      expect(result.name).to eq('Media')
      expect(response).to redirect_to departments_path
    end
    it "doesn't create a new department" do
      post departments_path, params: invalid_params
      expect(response).not_to redirect_to departments_path
    end
  end

  describe "DELETE /destroy" do
    let(:department){create(:department)}

    it "deletes a department" do
      delete department_path(department)
      expect(response).to redirect_to departments_path
    end
  end
end

