class DashboardController < ApplicationController
	before_action :authenticate_user!

  def index
  	@totalmembers = Membership.count
  	@memberfemale = Membership.where(gender: 'Female').count
  	@membermale = Membership.where(gender: 'Male').count
  	@malepercent = @membermale.to_d / @totalmembers.to_d * 100
  	@femalepercent = @memberfemale.to_d / @totalmembers.to_d * 100
  end

end
