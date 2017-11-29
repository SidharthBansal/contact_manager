require 'test_helper'

class PersonTest < ActiveSupport::TestCase


  def setup
    @person = Person.new(first_name: "Batman", last_name: "Foobar")
  end

  test "first_name should be present" do
    @person.first_name = ""
    assert_not @person.valid?
  end

  test "first_name should be longer than 2 characters" do
    @person.first_name = "a" * 2
    assert_not @person.valid?
  end

  test "first_name should not be longer than 50 characters" do
    @person.first_name = "a" * 51
    assert_not @person.valid?
  end

  test "first_name should not contain symbols or numbers" do
    bad_names = %w(batman1 bat%man bat/man ba$man)
    bad_names.each do |bad_name|
      @person.first_name = bad_name
      assert_not @person.valid?
    end
  end

  test "last_name should be present" do
    @person.last_name = ""
    assert_not @person.valid?
  end

  test "last name should be larger than 2 char" do
    @person.last_name = "a"*2
    assert_not @person.valid?
  end

  test "last_name should not be longer than 50 characters" do
    @person.last_name = "q"*51
    assert_not @person.valid?
  end

  test "last_name should not contain symbols and numbers" do
    wrong_names = ["superD0per", "m#}{jfak", "afkh-fa"]
    wrong_names.each do |wrong_name|
      @person.last_name = wrong_name
      assert_not @person.valid?
    end
  end

end
