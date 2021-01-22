require 'rails_helper'

RSpec.describe "MemberGroups", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/member_groups/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/member_groups/new"
      expect(response).to have_http_status(:success)
    end
  end

end
