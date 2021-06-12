require 'rails_helper'

RSpec.describe "Memberships", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end
 
  describe "GET /index" do
    it "will get all members created" do
      get "/memberships"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/memberships/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    let(:membership){create(:membership)}

    it "shows a member" do
      get membership_path(membership), params: {id: membership.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    let(:membership){create(:membership)}

    it "updates a member" do
      get edit_membership_path(membership), params: {id: membership.id}
      expect(response).to have_http_status(:success)
    end
  end

  
  describe "POST /memberships" do
    it "creates a new member" do
      post "/memberships", params: {membership: {member_id: 'KRIM0001', firstname: 'Allan', lastname: 'Aikins', othernames: 'Papa', title: 'Mr.', gender: 'Male', date_of_birth: '1990-06-23', primary_phone_number: 578034667, other_phone_number: 0, email: 'allanaikins@gmail.com', hometown: 'Mumford', residential_location: 'Ashongman Estate A-line', occupation: 'Software Engineer',  marital_status: 'Single', work_place: 'Paystack',  year_joining_church: 2016 }}

      result = Membership.last
      expect(result.firstname).to eq('Allan')
      expect(response).to redirect_to memberships_path
    end
  end

  describe "DELETE /memberships/:id" do
    let(:membership){create(:membership)}

    it "deletes a member" do    
      delete membership_path(membership), params: {id: membership.id}
      expect(response).to redirect_to memberships_path
    end
  end
end
