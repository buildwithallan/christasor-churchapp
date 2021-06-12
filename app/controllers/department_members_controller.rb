class DepartmentMembersController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	 @q = DepartmentMember.ransack(params[:q])
     @pagy, @department_members = pagy(@q.result(distinct: true))
  end

  def new
  	@department_member = DepartmentMember.new
  end

  def create
  	@department_member = DepartmentMember.create(departmentmember_params)

  	if @department_member.save
  		redirect_to department_members_path, notice: "Department Member added successfully"
  	else
  		render :new
  	end
  end

  private

  def departmentmember_params
  	params.require(:department_member).permit(:name, :department_id)
  end
end
