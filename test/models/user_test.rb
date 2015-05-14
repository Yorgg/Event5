require 'test_helper'


class UserTest < ActiveSupport::TestCase
  
def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "bad passwords should fail" do
  	@user.password = @password_confirmation = "shoe"
    assert_not @user.valid?, 'Password requirements not being met'
  end

  test "invalid emails should fail" do
  	@user.email = '@'
    assert_not @user.valid?, 'Email requirements not being met'
  end

  test "valid emails should pass" do
    emails = %w[jon@outlook.com THE_US-ER@foo.bar.org 
    	first.last@foo.jp STEVE.nash@gmail.com stevebalmer@cool.ca]
  	emails.each do |x|
  	  @user.email = x
  	  assert @user.valid?, "#{x.inspect} should be valid"
  	end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAMPle.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
