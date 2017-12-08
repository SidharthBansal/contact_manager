require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @phone = phone_numbers(:phone)
    @person = people(:nick)
    @base_title = "| ContactManager"
  end

  test "should get new" do
    log_in_as(@user)
    get new_person_phone_number_path(@person.id)
    assert_response :success
    assert_select "title", "New Number #{@base_title}"
    assert_template 'phone_numbers/new'
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_person_phone_number_path(@person.id, @phone.id)
    assert_response :success
    assert_select "title", "Edit Number #{@base_title}"
    assert_template 'phone_numbers/edit'
  end

end
