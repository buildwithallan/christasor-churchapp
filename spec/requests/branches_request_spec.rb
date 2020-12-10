require 'rails_helper'

RSpec.describe "Branches", type: :request do

  describe "GET /index" do
    it "will get all branches created" do
      get "/branches"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/branches/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    let(:branch){create(:branch)}

    it "returns http success" do
      get edit_branch_path(branch), params: {id: branch.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /branches" do
    it "creates a new branch" do
      post "/branches", params: {branch: {country: 'Ghana', district: 'Gt. Accra', location: 'Kwabenya', branchname: 'KRIMAchimota', leaders_name: 'Allan Aikins', contact1: 241699911, contact2: 0, contact3: 0}}

      result = Branch.last
      expect(result.branchname).to eq('KRIMAchimota')
      expect(response).to redirect_to(:action => :index)
    end
  end

end
