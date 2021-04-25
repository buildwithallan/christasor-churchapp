class MemberGroupsController < ApplicationController
  def index
     @q = MemberGroup.ransack(params[:q])
     @pagy, @member_groups = pagy(@q.result(distinct: true))
  end

  def new
  	@member_group = MemberGroup.new
  end

  def create
  	@member_group = MemberGroup.create(membergroup_params)
  	if @member_group.save
  		redirect_to member_groups_path, notice: "Group Member added successfully"
  	else
  		render :new
  	end
  end

  private

  def membergroup_params
  	params.require(:member_group).permit(:fullname, :group_id)
  end
end
