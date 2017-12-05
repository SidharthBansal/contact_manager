require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @base_title = "| ContactManager"
  end

  test "should get show" do
    get user_path(@user.id)
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
    assert_template 'users/new'
    assert_select "title", "Sign up #{@base_title}"
  end

  test "successful create" do
    get new_user_path
    assert_difference "User.count", 1 do
      post users_path :params, user: {
        username: "banana",
        email: "banana@gmail.com",
        password: "ilovebananas",
        password_confirmation: "ilovebananas"
      }
    end
    follow_redirect!
    assert_template 'users/show'
  end

  test "should get edit" do
    get edit_user_path(@user.id)
    assert_response :success
    assert_template 'users/edit'
    assert_select "title", "Edit user #{@base_title}"
  end

  test "successful update" do
    get new_user_path
    patch user_path(@user.id), params: { user: { username: "lemon",
                                                  email: "lemonade@email.com",
                                                  password: "foobar",
                                                  password_confirmation: "foobar" } }
    assert_not flash.empty?
    assert_redirected_to @user
  end

end
