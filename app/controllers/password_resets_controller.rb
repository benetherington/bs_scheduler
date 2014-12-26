class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]


  def new
  end

  def edit
  end

  def create
      @user = User.find_by(email: params[:password_reset][:email].downcase)

      if @user
          @user.create_reset_digest
          @user.send_password_reset_email
          redirect_to root_url, notice: "Check your email for a password reset link"
      else
          flash.now[:notice] = "Check your spelling; I don't recognize that email"
          render 'new'
      end
  end

  def update
    if both_passwords_blank?
      flash.now[:notice] = "Password/confirmation can't be blank"
      render "edit"
    elsif @user.update_attributes(user_params)
      log_in @user
      redirect_to events_url, notice: "Password has been reset."
    else
      render 'edit'
    end
  end

  private

  def get_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    unless ( @user && @user.activated? && @user.authenticated?(:reset, params[:id]) )
      redirect_to root_url
    end
  end

  def check_expiration
    if @user.password_reset_expired?
      redirect_to new_password_reset_url, notice: "That password reset code has expired."
    end
  end


  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def both_passwords_blank?
    params[:user][:password].blank? && params[:user][:password_confirmation].blank?
  end

end




