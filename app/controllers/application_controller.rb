class ApplicationController < ActionController::Base
 include Pagy::Backend
 
 helper_method :authenticate_user!
 before_action :set_current_user


 def set_current_user
 	if session[:user_id]
 		Current.user = User.find_by(id: session[:user_id])
 	end
 end

 def authenticate_user!
 	redirect_to login_path, alert: "You must be Logged in to do that" if Current.user.nil?
 end
end
	


