require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
  end

  test "should get show" do
    get user_path(@user.id)
    assert_response :success
  end

  test "should get new" do
    get new_user_path
    assert_response :success
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
  end


end
