class UsersController < ApplicationController
  before_action :authenticate_user!
  
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

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :user_type)
  end
end
