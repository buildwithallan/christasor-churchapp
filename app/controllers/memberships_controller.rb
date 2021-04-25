class MembershipsController < ApplicationController
  def index
    @q = Membership.ransack(params[:q])
    @pagy, @memberships = pagy(@q.result(distinct: true))
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
  	@membership = Membership.friendly.find(params[:id])
  end

  def edit
  	@membership = Membership.friendly.find(params[:id])
  end

  def update
  	@membership = Membership.friendly.find(params[:id])

  	if @membership.update(membership_params)
  	 redirect_to membership_path, notice: "Member updated successfully"
  	 else
  	 render :edit	
  	end
  end

  def destroy
  	@membership = Membership.friendly.find(params[:id])

  	@membership.destroy
  	redirect_to memberships_path
  end

  private

  def membership_params
  	params.require(:membership).permit(:image, :member_id, :firstname, :lastname, :othernames, :title, :position, :gender, :date_of_birth, :primary_phone_number, :other_phone_number, :email, :hometown, :residential_location, :occupation, :marital_status, :work_place, :year_joining_church)	
  end
end
