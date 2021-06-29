class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)

  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to users_path, notice: "User added successfully"
  	else
  		render :new
  	end
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "Successfully updated user"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User destroyed succesfully"
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end

  def set_user
    @user =  User.find(params[:id])
  end
end
