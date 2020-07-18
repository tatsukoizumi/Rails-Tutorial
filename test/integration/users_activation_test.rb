require 'test_helper'

class UsersActivationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @non_actiavted = users(:non_active)
  end
  
  test "should not display non-activated users in index " do
    log_in_as(@user)
    get users_path
    assert_select "a[href=?]", user_path(@user)
    assert_select "a[href=?]", user_path(@non_actiavted), count: 0
  end
  
  test "should not show non-activated user" do
    log_in_as(@user)
    get user_path(@non_actiavted)
    assert_redirected_to root_url
  end

end
