class MemberGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_member_group, only: [:edit, :update, :destroy]
  
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

  def show  
  end

  def edit  
  end

  def update
    if @member_group.update(membergroup_params)
     redirect_to member_groups_path, notice: "Group Member updated successfully"
    else
      render :edit
    end
  end

   def destroy 
    @member_group.destroy
    redirect_to member_groups_path, notice: "Group Member deleted" 
  end

  private

  def set_member_group
    @member_group = MemberGroup.find(params[:id])
  end

  def membergroup_params
  	params.require(:member_group).permit(:fullname, :group_id)
  end
end
