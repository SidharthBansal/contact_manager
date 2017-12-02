require 'test_helper'

class PhoneNumbersFlowsTest < ActionDispatch::IntegrationTest
=begin
  def setup
    @phone_number = phone_number(:phone)
  end

  test "invalid phone_number information" do
    get new_phone_number_path
    assert_template "phone_number/new"
    post phone_number_path, params: {:phone_number {
                                      number: ""
                                              }}
  end
=end
end
=begin
def setup
  @person = people(:nick)
end

test "invalid person information" do
  get new_person_path
  assert_template "people/new"
  post people_path, params: {:person {
                              first_name: "",
                              last_name: "12%·!"} }
  assert_select "div#error_explanation"
  assert_template "people/new"
end

test "valid person information" do
  get new_person_path
  assert_template "people/new"
  post people_path, params: {:person {first_name: "foobar",
                                      last_name: "lastname"}}
  assert_not flash.empty?
  assert_redirected_to root_path
end

test "delete should equal people - 1"  do
  assert_difference "Person.count", -1 do
    delete person(@person.id)
  end
  assert_not flash.empty?
  assert_redirected_to root_path
end
=end
