class AccountActivationsController < ApplicationController

    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.activate
            log_in user
            redirect_to events_url, notice: "Account activated, welcome!"
        else
            redirect_to root_url, notice: "Invalid activation link"
        end
    end

end
