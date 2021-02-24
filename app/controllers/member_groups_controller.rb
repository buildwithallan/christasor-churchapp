class MemberGroupsController < ApplicationController
  def index
  	#@member_groups = MemberGroup.all


     @q = MemberGroup.ransack(params[:q])
     @member_groups = @q.result(distinct: true)
  end

  def new
  	@member_group = MemberGroup.new
  end

  def create
  	@member_group = MemberGroup.create(membergroup_params)
  	if @member_group.save
  		redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def membergroup_params
  	params.require(:member_group).permit(:fullname, :group_id)
  end
end
