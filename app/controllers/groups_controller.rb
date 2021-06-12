class GroupsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	@pagy, @groups = pagy(Group.all)
  end

  def new
    @group = Group.new
  end

  def create
  	@group = Group.create(group_params)

  	if @group.save
  		redirect_to groups_path, notice: "Group added successfully"
  	else
  		render :new
  	end
  end

  private

  def group_params
  	params.require(:group).permit(:group_name)
  end
end
