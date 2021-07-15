class DepartmentMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_department_member, only: [:edit, :update, :destroy]
  
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

  def show  
  end

  def edit
  end

  def update
    if @department_member.update(departmentmember_params)
     redirect_to department_members_path, notice: "Department Member updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @department_member.destroy
    redirect_to department_members_path, notice: "Department Member deleted"
  end

  private

  def set_department_member
    @department_member = DepartmentMember.find(params[:id])
  end

  def departmentmember_params
  	params.require(:department_member).permit(:name, :department_id)
  end
end
