class SessionsController < ApplicationController

    def new
    end


    #refactor with case
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            if user.activated?
                log_in user
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                redirect_back_or events_url
            else
                redirect_to root_url, notice: "You need to activate your account first. Check your email."
            end
        else
            flash.now[:notice] = 'Invalid email/password combination'
            render 'new'
        end
    end

    def destroy
        log_out if logged_in?
        flash[:notice] = "You have successfully logged out."
        redirect_to root_url
    end

end
