class MembershipsController < ApplicationController
  def index
  end

  def new
  	@membership = Membership.new
  end

  def create
  	@membership = Membership.create(membership_params)

  	if @membership.save
  	  redirect_to :action => :index
  	  else
  	  render :new	
  	end
  end

  def show
  	@membership = Membership.find(params[:id])
  end

  def edit
  	@membership = Membership.find(params[:id])
  end

  def update
  	@membership = Membership.find(params[:id])

  	if @membership.update(membership_params)
  	 redirect_to @membership
  	 else
  	 render :edit	
  	end
  end

  def destroy
  	@membership = Membership.find(params[:id])

  	@membership.destroy
  	redirect_to :action => :index
  end

  private

  def membership_params
  	params.require(:membership).permit(:image, :member_id, :firstname, :lastname, :othernames, :title, :position, :gender, :date_of_birth, :primary_phone_number, :other_phone_number, :email, :hometown, :residential_location, :occupation, :marital_status, :work_place, :year_joining_church )	
  end
end
