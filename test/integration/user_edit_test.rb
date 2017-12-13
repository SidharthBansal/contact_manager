
require 'test_helper'

class UserEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @other_user = users(:robin)
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name = "foobar"
    email = "foobar@email.com"
    patch user_path(@user), params: { user: { username: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: ""} }
    assert_not flash.empty?
    assert_redirected_to @user
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "",
                                              email: "invalidemail" } }
    assert_template 'users/edit'
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: { user: { username: @user.username,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should redirect update when logged in as wrong user" do
    log_in_as(@other_user)
    patch user_path(@user), params: { user: { username: @user.username,
                                              email: @user.email } }
    assert_not flash.empty?
    assert_redirected_to login_path
    end

end
