class DashboardController < ApplicationController
  def index
  	@totalmembers = Membership.count
  	@memberfemale = Membership.where(gender: 'Female').count
  	@membermale = Membership.where(gender: 'Male').count
  	@malepercent = @membermale.to_f / @totalmembers.to_f * 100 
  	@femalepercent = (@memberfemale.to_f / @totalmembers.to_f * 100)
  end

end
