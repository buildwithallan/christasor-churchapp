class GroupsController < ApplicationController
  
  def index
  	@groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
  	@group = Group.create(group_params)

  	if @group.save
  		redirect_to :action => :index
  	else
  		render :new
  	end
  end

  private

  def group_params
  	params.require(:group).permit(:group_name)
  end
end
