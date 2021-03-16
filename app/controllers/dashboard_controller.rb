class DashboardController < ApplicationController
  def index
  	@memberships = Membership.all
  	@branches = Branch.all
  	@memberfemale = Membership.where(gender: 'Female').count
  	@membermale = Membership.where(gender: 'Male').count
  end

end
