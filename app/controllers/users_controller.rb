class UsersController < ApplicationController

  # need to eventually update so that users can't view other users' profiles. This isn't a goddamned social network.
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      # todo: add auto-login contingent on remember-me
      # log_in @user
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

    def logged_in_user
      unless logged_in?
        redirect_to login_url, notice: "You need to login to do that."
      end
    end

    def correct_user
      @user = User.find(params[:id])

      # puts "@user"
      # puts @user.inspect
      # puts "current"
      # puts current_user.inspect

      redirect_to(root_url) unless current_user?(@user)
    end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:id, :name, :email, :password, :password_confirmation)
    end
end
