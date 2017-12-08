require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase

  def setup
    @person = people(:nick)
    @phone = @person.phone_numbers.build(number: "192749817")
  end

  test "number should be unique" do
    copy = @phone.dup
    @phone.save
    assert_not copy.valid?
  end

  test "number length should be greater than 5" do
    @phone.number =  "1234"
    assert_not @phone.valid?
  end

end
