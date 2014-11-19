require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

	def setup
		@user =  users(:michael)
	end

	test "unsuccessful edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		patch user_path(@user), user: { name: "", email: "heythat@doesntwork", password: "asdf", password_confirmation: "ghjk" }
		assert_template 'users/edit'
	end

	test "successful edit" do
		log_in_as(@user)
		get edit_user_path(@user)
		assert_template 'users/edit'
		name = "Foo Bar"
		email = "example@test.com"
		patch user_path(@user), user: { name:  name,
		                                email: email,
		                                password:              "",
		                                password_confirmation: "" }
		# remember that if the below fails, it may be because the above returned an error
		assert_not flash.empty?
		assert_redirected_to @user
		@user.reload
		assert_equal @user.name, name
		assert_equal @user.email, email
	end


end






