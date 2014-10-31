class SessionsController < ApplicationController

	def new
	end

	def create
		logger.debug "starting login"
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			logger.debug "found user, correct password, beginning log_in"
			log_in user
			logger.debug "beginning remember"
			remember user
			logger.debug "beginning redirect"
			redirect_to events_url
		else
			flash.now[:notice] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		log_out
		flash[:notice] = "You have successfully logged out."
		redirect_to root_url
	end

end
