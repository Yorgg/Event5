require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
   test "succesful signup should create user" do
     before = User.count
     visit signup_path
     fill_in('user_name', :with => 'John')
     fill_in('user_email', :with => 'john_edward@universe.com')
     fill_in('user_password', :with => 'Seekrit')
     click_on('Create my account')
     after = User.count
     assert_not_equal before, after
   end
   
end
