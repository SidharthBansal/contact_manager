require 'test_helper'

class EmailTest < ActiveSupport::TestCase

  def setup
    @person = people(:nick)
    @email = @person.emails.build(email: "superman@email.com")
  end

  test "email address should be present" do
    @email.email = ""
    assert_not @email.valid?
  end

  test "email address shouldn't be longer than 255 chr" do
    @email.email = "q"*256
    assert_not @email.valid?
  end

  test "email should be email format" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
  end

  test "email address should be unique" do
    duplicate_email = @email.dup
    @email.save
    assert_not duplicate_email.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@ExAmple.CoM"
    @email.email = mixed_case_email
    @email.save
    assert_equal mixed_case_email.downcase, @email.reload.email
  end
end
