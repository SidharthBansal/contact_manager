require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
  end

  test "login with invalid information" do
    get login_path
    assert_template "sessions/new"
    post login_path params: {session: {email: "invalid@email.com",
                                       password: "invalidpassword"}}
    assert_template "sessions/new"
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information followed by logout" do
    #Log in
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'foobar' } }
    assert_redirected_to root_path
    follow_redirect!
    assert_template 'pages/home'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", root_path
    assert is_logged_in?
    # Log out once
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_path
    # Log out a second time in a second window
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", logout_path, count: 0
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    #Log in to set the cookie.
    log_in_as(@user, remember_me: '1')
    #Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end
end
