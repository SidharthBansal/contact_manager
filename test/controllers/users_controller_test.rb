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
    assert_difference "User.count", 1 do
      patch user_path(@user.id), params: { user: { username: "lemon",
                                                   email: "lemonade@email.com",
                                                   password: "foobar",
                                                   password_confirmation: "foobar" } }
    end
    assert_not flash.empty?
    assert_redirected_to @user
  end

end
=begin





Prefix Verb   URI Pattern                       Controller#Action
            root GET    /                                 people#index
           login GET    /login(.:format)                  sessions#new
                 POST   /login(.:format)                  sessions#create
          logout DELETE /logout(.:format)                 sessions#destroy
           users GET    /users(.:format)                  users#index
                 POST   /users(.:format)                  users#create
        new_user GET    /users/new(.:format)              users#new
       edit_user GET    /users/:id/edit(.:format)         users#edit
            user GET    /users/:id(.:format)              users#show
                 PATCH  /users/:id(.:format)              users#update
                 PUT    /users/:id(.:format)              users#update
                 DELETE /users/:id(.:format)              users#destroy
          people POST   /people(.:format)                 people#create
      new_person GET    /people/new(.:format)             people#new
     edit_person GET    /people/:id/edit(.:format)        people#edit
          person GET    /people/:id(.:format)             people#show
                 PATCH  /people/:id(.:format)             people#update
                 PUT    /people/:id(.:format)             people#update
                 DELETE /people/:id(.:format)             people#destroy
   phone_numbers POST   /phone_numbers(.:format)          phone_numbers#create
new_phone_number GET    /phone_numbers/new(.:format)      phone_numbers#new
edit_phone_number GET    /phone_numbers/:id/edit(.:format) phone_numbers#edit
    phone_number PATCH  /phone_numbers/:id(.:format)      phone_numbers#update
                 PUT    /phone_numbers/:id(.:format)      phone_numbers#update
                 DELETE /phone_numbers/:id(.:format)      phone_numbers#destroy
sidharth@sidharth-Lenovo-ideapad-310-15IKB:~/Desktop/ROR/Jumpstart/contact_manager$



=end
