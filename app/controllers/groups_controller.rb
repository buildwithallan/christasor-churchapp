class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:edit, :update, :destroy]
  
  def index
  	@pagy, @groups = pagy(Group.all, items: 10)
  end

  def new
    @group = Group.new
  end

  def create
  	@group = Group.create(group_params)

  	if @group.save
  		redirect_to groups_path, notice: "Group #{@group.group_name} added successfully"
  	else
  		render :new
  	end
  end

  def show   
  end

  def edit
  end

  def update
    if @group.update(group_params)
     redirect_to groups_path, notice: "Group #{@group.group_name} updated successfully"
    else
      render :edit
    end
  end

  def destroy 
    @group.destroy
    redirect_to groups_path, notice: "Group #{@group.group_name} deleted" 
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
  	params.require(:group).permit(:group_name)
  end
end
