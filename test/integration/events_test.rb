class UsersSignupTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:jean)
  end

   test "succesful event creation should create an event" do
     visit login_path
     fill_in('session_email', :with => @user.email)
     fill_in('session_password', :with => 'password')
     click_button('Log in')

     before = Event.count
     visit new_path
     fill_in('event_title', :with => 'Bday')
     fill_in('event_address', :with => '467 Evergeen way')
     fill_in('event_body', :with => 'Fun times with the gals')
     fill_in('event_starts_at', :with => '2016/05/24')
     fill_in('event_time', :with => '14:25')
     click_button('Create event')
     after = Event.count
     assert_not_equal before, after
   end
end