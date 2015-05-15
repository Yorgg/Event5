require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jean)
  end
  
  test "log in from correct menu with valid information, log out from correct menu" do
    has_button?('Menu')
    visit login_path
    fill_in('session_email', :with => @user.email)
    fill_in('session_password', :with => 'password')
    click_button('Log in')
    has_button?(@user.name)
    assert_equal current_path, user_path(@user.id)
    click_on('home-button')
    click_on('Log out')
    has_button?('Menu')
  end
end
