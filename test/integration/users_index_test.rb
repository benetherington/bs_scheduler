require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

	def setup
		@admin = users(:michael)
		@non_admin = users(:archer)
	end

	test "delete links as admin" do
		log_in_as(@admin)
		get users_path
		assert_template 'users/index'
		
	end



end
