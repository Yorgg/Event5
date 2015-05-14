 
class HomeTest < ActionDispatch::IntegrationTest
  test 'navigation should visit home page' do
    visit root_path
    click_on 'Event5'
    assert_equal  current_path, root_path
  end
end