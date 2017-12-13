require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  def setup
    @user = users(:batman)
  end

  test "account_activation" do
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "Account Activation", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["noreply@contactmanager.com"], mail.from
    assert_match @user.username,          mail.body.encoded
    assert_match @user.activation_token,  mail.body.encoded
    assert_match CGI.escape(@user.email), mail.body.encoded
  end

  test "password_reset" do
    @user.reset_token = User.new_token
    mail = UserMailer.password_reset(@user)
    assert_equal "Password Reset", mail.subject
    assert_equal ["noreply@contactmanager.com"], mail.from
    assert_match @user.username, mail.body.encoded
    assert_match @user.reset_token, mail.body.encoded
    assert_match CGI.escape(@user.email), mail.body.encoded
  end
=begin
ERROR["test_password_reset", UserMailerTest, 1.866545054999733]
 test_password_reset#UserMailerTest (1.87s)
NoMethodError:         NoMethodError: undefined method `reset_password' for UserMailer:Class
            test/mailers/user_mailer_test.rb:22:in `block in <class:UserMailerTest>'

  87/87: [==========================================================] 100% Time: 00:00:02, Time: 00:00:02

Finished in 2.01005s
87 tests, 230 assertions, 0 failures, 1 errors, 0 skips

=end
end
