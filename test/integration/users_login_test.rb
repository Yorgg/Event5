require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jean)
  end
  
  test "login with valid information" do
    visit login_path
    fill_in('session_email', :with => @user.email)
    fill_in('session_password', :with => 'password')
    click_on('Log in') 
    assert_equal current_path, user_path(@user.id)
  end
end
