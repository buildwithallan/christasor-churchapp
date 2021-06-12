module SpecTestHelper	
	def login(user)
	  post login_path, params: {email: user.email, password: user.password}
	  request.session[:user_id] = user.id
	end
end