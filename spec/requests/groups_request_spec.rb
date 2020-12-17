require 'rails_helper'

RSpec.describe "Groups", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/groups/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "will get all groups created" do
      get "/groups"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /groups" do
    it "creates a goup name" do
      post "/groups", params: {group: {group_name: "Jericho"}}

      result = Group.last
      expect(result.group_name).to eq("Jericho")
      expect(response).to redirect_to(:action => :index)
    end
  end

end
