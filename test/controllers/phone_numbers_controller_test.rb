require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get phone_numbers_edit_url
    assert_response :success
  end

  test "should get new" do
    get phone_numbers_new_url
    assert_response :success
  end

  test "should get update" do
    get phone_numbers_update_url
    assert_response :success
  end

  test "should get create" do
    get phone_numbers_create_url
    assert_response :success
  end

  test "should get delete" do
    get phone_numbers_delete_url
    assert_response :success
  end

end
