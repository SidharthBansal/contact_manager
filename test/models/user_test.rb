require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "mario", email: "mario@email.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid?" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should be at least 3 characters long" do
    @user.username = "a" * 2
    assert_not @user.valid?
  end

  test "username should be under 20 characters long" do
    @user.username = "a" * 21
    assert_not @user.valid?
  end

  test "username only alphanumberic and underscore" do
    bad_usernames = %w[Bat%man Ba$man bat@man bat#ma-n]
    bad_usernames.each do |bad_username|
      @user.username = bad_username
      assert_not @user.valid?
    end
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = "another@email.com"
    @user.save
    assert_not duplicate_user.valid?
  end


  test "email address should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "email address shouldn't be longer than 255 chr" do
    @user.email = "q"*256
    assert_not @user.valid?
  end

  test "email should be email format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
  end

  test "email address should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = "another_username"
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAmple.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minumum length of 6 chr" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?(:remember, '')
  end


end
