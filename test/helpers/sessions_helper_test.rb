require 'test_helper'

class SessionsHelperTest < ActionView::TestCase

  def setup
    @user = users(:batman)
    log_in_as(@user)
    remember(@user)
  end

  test "current_user returns right user when session is nil" do
    assert_equal @user, current_user
    assert is_logged_in?
  end

  test "current_user returns nil when remember digest is wrong" do
    @user.update_attribute(:remember_digest, User.digest(User.new_token))
    assert_nil current_user
  end

end


FAIL["test_login_with_remembering", UsersLoginTest, 1.5999506090010982]
test_login_with_remembering#UsersLoginTest (1.60s)
       Expected: "true"
         Actual: true
       test/integration/users_login_test.rb:46:in `block in <class:UsersLoginTest>'

FAIL["test_login_without_remembering", UsersLoginTest, 1.7302086559939198]
test_login_without_remembering#UsersLoginTest (1.73s)
       Expected "true" to be empty.
       test/integration/users_login_test.rb:55:in `block in <class:UsersLoginTest>'

FAIL["test_current_user_returns_nil_when_remember_digest_is_wrong", SessionsHelperTest, 1.7463172400020994]
test_current_user_returns_nil_when_remember_digest_is_wrong#SessionsHelperTest (1.75s)
       Expected #<User id: 571615246, username: "Batman", email: "batman@email.com", created_at: "2017-12-06 15:23:52", updated_at: "2017-12-06 15:23:54", password_digest: "$2a$04$LRDzTad8xtsy6FIKcgzANeLhvxgDVKWykK5ycyZRe0G...", remember_digest: "$2a$04$p0X/L2qSCSAYFhqbiW0XOerPjjsRkvwARnKMjLVpNad..."> to be nil.
       test/helpers/sessions_helper_test.rb:18:in `block in <class:SessionsHelperTest>'

 46/46: [=================================================================================================] 100% Time: 00:00:02, Time: 00:00:02

Finished in 2.21215s
46 tests, 98 assertions, 3 failures, 0 errors, 0 skips
