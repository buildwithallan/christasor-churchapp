class DepartmentMembersController < ApplicationController
  def index
  	 @q = DepartmentMember.ransack(params[:q])
     @department_members = @q.result(distinct: true)
  end

  def new
  	@department_member = DepartmentMember.new
  end

  def create
  	@department_member = DepartmentMember.create(departmentmember_params)

  	if @department_member.save
  		redirect_to department_members_path
  	else
  		render :new
  	end
  end

  private

  def departmentmember_params
  	params.require(:department_member).permit(:name, :department_id)
  end
end
