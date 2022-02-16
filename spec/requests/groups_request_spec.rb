require 'rails_helper'

RSpec.describe "Groups", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_path, params: {email: user.email, password: user.password}
end


let(:valid_params) do {
 group: {
  group_name: "Jericho"
 }
}
end

let(:invalid_params) do {
 group: {
  group_name: ""
 }
}
end


  describe "GET /index" do
    let(:group){create(:group)}

    it "displays all groups created" do
      get groups_path
      expect(response).to be_successful
    end
  end

   describe "GET /new" do
    it "renders a successful response" do
      get new_group_path
      expect(response).to be_successful
    end
  end

   describe "GET /edit" do
    let(:group){create(:group)}

    it "renders a successful response" do
      get edit_group_path(group)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:group){create(:group)}

    it "updates a department" do
      patch group_path(group), params: valid_params
      expect(response).to redirect_to groups_path
    end
    it "doesn't update a department" do
      patch group_url(group), params: invalid_params
      expect(response).not_to redirect_to groups_path
    end
  end

  describe "POST /groups" do
    it "creates a goup name" do
      post groups_path, params: valid_params

      result = Group.last
      expect(result.group_name).to eq("Jericho")
      expect(response).to redirect_to groups_path
    end
    it "doesn't create a group name" do
      post groups_path, params: invalid_params
      expect(response).not_to redirect_to groups_path
    end
  end

  describe "DELETE /destroy" do
    let(:group){create(:group)}

    it "deletes a group" do
      delete group_path(group)
      expect(response).to redirect_to groups_path
    end
  end
end


