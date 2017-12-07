require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @person = @user.people.create!(first_name: "Jim", last_name: "Foobar")
    @base_title = "| ContactManager"
  end


  test "should get show" do
    log_in_as(@user)
    get person_path(@person.id)
    assert_response :success
    assert_template 'people/show'
    assert_select 'title',  "#{@person.first_name} #{@base_title}"
  end

  test "should get new" do
    log_in_as(@user)
    get new_person_path
    assert_response :success
    assert_template 'people/new'
    assert_select 'title',  "New Contact #{@base_title}"
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_person_path(@person.id)
    assert_response :success
    assert_template 'people/edit'
    assert_select 'title',  "Edit #{@base_title}"
  end

end
