module SessionsHelper

	def log_in(user)
		logger.debug "helper here. performing log_in"
		session[:user_id] = user.id
	end

	def remember(user)
		logger.debug "helper here. performing remember"
		user.remember
		logger.debug "helper here. saving ID cookeie"
		cookies.permanent.signed[:user_id] = user.id
		logger.debug "helper here. saving token cookie"
		cookies.permanent[:remember_token] = user.remember_token
	end

	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end

	# Returns the user first by session then by remember token cookie
	def current_user
		logger.debug "starting current_user check"
		if (user_id = session[:user_id])
			logger.debug "found session id: #{session[:user_id].inspect}"
			@current_user ||= User.find_by(id: session[user_id])
		elsif (user_id = cookies.signed[:user_id])
			logger.debug "found cookie."
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
				logger.debug "found cookie, good remember_token"
				log_in user
				@current_user = user
			end
		end
	end

	def logged_in?
		logger.debug "looking for logged_in"
		!current_user.nil?
	end

	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end

end
