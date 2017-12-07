require 'test_helper'

class PeopleFlowsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @person = @user.people.create!(first_name: "Jim", last_name: "Foobar")
  end

  test "invalid person information" do
    log_in_as(@user)
    get new_person_path
    assert_template "people/new"
    post people_path, params: { person: {
                                first_name: "",
                                last_name: "12%·!"} }
    assert_select "div#error_explanation"
    assert_template "people/new"
  end

  test "valid person information" do
    log_in_as(@user)
    get new_person_path
    assert_template "people/new"
    assert_difference "Person.count", 1 do
      post people_path, params: {person: {first_name: "foobar",
                                          last_name: "lastname"} }
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end

  test "delete should equal people - 1"  do
    log_in_as(@user)
    assert_difference "Person.count", -1 do
      delete person_path(@person.id)
    end
    assert_not flash.empty?
    assert_redirected_to root_path
  end

end
