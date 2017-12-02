require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @phone = phone_numbers(:phone)
    @base_title = "| ContactManager"
  end

  test "should get new" do
    get new_phone_number_path
    assert_response :success
    assert_select "title", "New Number #{@base_title}"
    assert_template 'phone_numbers/new'
  end

  test "should get edit" do
    get edit_phone_number_path(@phone.id)
    assert_response :success
    assert_select "title", "Edit Number #{@base_title}"
    assert_template 'phone_numbers/edit'
  end


end
