class MembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_membership, only: [:show, :edit, :update, :destroy]
  
  def index
    @q = Membership.ransack(params[:q])
    @pagy, @memberships = pagy(@q.result(distinct: true), items: 20)
  end

  def new
  	@membership = Membership.new
  end

  def create
  	@membership = Membership.create(membership_params)

  	if @membership.save
  	  redirect_to memberships_path, notice: "Member added successfully"
  	  else
  	  render :new	
  	end
  end

  def show
  end

  def edit
  end

  def update

  	if @membership.update(membership_params)
  	 redirect_to membership_path, notice: "Member updated successfully"
  	 else
  	 render :edit	
  	end
  end

  def destroy
  	@membership.destroy
  	redirect_to memberships_path, notice: "Member updated successfully"
  end

  private

  def set_membership
    @membership = Membership.friendly.find(params[:id])
  end

  def membership_params
  	params.require(:membership).permit(:image, :member_id, :firstname, :lastname, :othernames, :title, :position, :gender, :date_of_birth, :primary_phone_number, :other_phone_number, :email, :hometown, :residential_location, :occupation, :marital_status, :work_place, :year_joining_church)	
  end
end
