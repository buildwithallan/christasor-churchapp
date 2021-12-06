require 'rails_helper'

RSpec.describe "Memberships", type: :request do

before do
  user = User.create!(email: "admin@admin.com", password: "password", user_type: "Admin")
  post login_url, params: {email: user.email, password: user.password}
end

let(:valid_params) do {
  membership: {
    member_id: 'KRIM0001', 
    firstname: 'Allan', 
    lastname: 'Aikins', 
    othernames: 'Papa', 
    title: 'Mr.', 
    gender: 'Male',
    date_of_birth: '1990-06-23', 
    primary_phone_number: 578034667,
    other_phone_number: 0, 
    email: 'allanaikins@gmail.com', 
    hometown: 'Mumford', 
    residential_location: 'Ashongman Estate A-line', 
    occupation: 'Software Engineer', 
    marital_status: 'Single', 
    work_place: 'Google', 
    year_joining_church: 2016
  }
}
end

let(:invalid_params) do {
  membership: {
    member_id: '', 
    firstname: 'Allan', 
    lastname: 'Aikins', 
    othernames: 'Papa', 
    title: 'Mr.', 
    gender: 'Male',
    date_of_birth: '1990-06-23', 
    primary_phone_number: 578034667,
    other_phone_number: 0, 
    email: 'allanaikins@gmail.com', 
    hometown: 'Mumford', 
    residential_location: 'Ashongman Estate A-line', 
    occupation: 'Software Engineer', 
    marital_status: 'Single', 
    work_place: 'Google', 
    year_joining_church: 2016
  }
}
end
 
  describe "GET /index" do
    let(:membership){create(:membership)}

    it "displays all members created" do
      get memberships_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_membership_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:membership){create(:membership)}

    it "renders a successful response" do
      get membership_url(membership)
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    let(:membership){create(:membership)}

    it "renders a successful response" do
      get edit_membership_url(membership)
      expect(response).to be_successful
    end
  end

  describe "PATCH /update" do
    let(:membership){create(:membership)}

    it "updates a member" do
      patch membership_url(membership), params: valid_params
      expect(response).to redirect_to membership_url
    end
     it "doesn't update a member" do
      patch membership_url(membership), params: invalid_params
      expect(response).not_to redirect_to membership_url
    end
  end

  
  describe "POST /memberships" do
    it "creates a new member" do
      post memberships_url, params: valid_params
      result = Membership.last
      expect(result.firstname).to eq('Allan')
      expect(response).to redirect_to memberships_url
    end
    it "doesn't create a new member" do
      post memberships_url, params: invalid_params
      expect(response).not_to redirect_to memberships_url
    end
  end

  describe "DELETE /destroy" do
    let(:membership){create(:membership)}

    it "deletes a member" do    
      delete membership_url(membership)
      expect(response).to redirect_to memberships_url
    end
  end
end
