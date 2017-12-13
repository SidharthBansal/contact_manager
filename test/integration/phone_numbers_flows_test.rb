require 'test_helper'

class PhoneNumbersFlowsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    @other_user = users(:robin)
    @person = people(:nick)                 #=> belongs to @user
    @phone_number = phone_numbers(:phone)   #=> belongs to @person
  end

  test "should be logged in to get phone_numbers/new" do
    get new_person_phone_number_path(@person.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should be logged in to post phone_numbers" do
    assert_no_difference 'PhoneNumber.count'do
      post person_phone_numbers_path(@person.id), params: {phone_number: { number: "1571283741" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "logged in / invalid phone_number information" do
    log_in_as(@user)
    get new_person_phone_number_path(@person.id)
    assert_template "phone_numbers/new"
    post person_phone_numbers_path(@person.id),
                                    params: { phone_number: {
                                                number: "" } }
    assert_select 'div#error_explanation'
    assert_template "phone_numbers/new"
  end

  test "GET phone_numbers/new as wrong user" do
    log_in_as(@other_user)
    get new_person_phone_number_path(@person.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "valid phone_number information wrong user" do
    log_in_as(@other_user)
    assert_no_difference 'PhoneNumber.count' do
      post person_phone_numbers_path(@person.id), params: {phone_number: { number: "1571283741" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "logged in as right user / valid phone_number information" do
    log_in_as(@user)
    get new_person_phone_number_path(@person.id)
    assert_template 'phone_numbers/new'
    assert_difference 'PhoneNumber.count', 1 do
      post person_phone_numbers_path(@person.id), params: {phone_number: { number: "1571283741" } }
    end
    assert_not flash.empty?
    assert_redirected_to @person
  end

  test "should be logged in to get phone_numbers/edit" do
    get edit_person_phone_number_path(@person.id, @phone_number.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should be logged in to patch phone_numbers" do
    patch person_phone_number_path(@person.id, @phone_number.id),
                                     params: { phone_number: { number: "1571283741" } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "invalid edit information (logged in) " do
    log_in_as(@user)
    get edit_person_phone_number_path(@person.id, @phone_number.id)
    assert_template "phone_numbers/edit"
    patch person_phone_number_path(@person.id, @phone_number.id),
                                    params: { phone_number: { number: "" } }
    assert_select 'div#error_explanation'
    assert_template "phone_numbers/edit"
  end

  test "GET phone_numbers/edit as wrong user" do
    log_in_as(@other_user)
    get edit_person_phone_number_path(@person.id, @phone_number.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "UPDATE phone_number as wrong user" do
    log_in_as(@other_user)
    patch person_phone_number_path(@person.id, @phone_number.id), params: {phone_number: { number: "1571283741" } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "successful edit" do
    log_in_as(@user)
    phone_number = @person.phone_numbers.create(number: "912837491827")
    get edit_person_phone_number_path(@person.id, phone_number.id)
    assert_template 'phone_numbers/edit'
    patch person_phone_number_path(@person.id, phone_number.id), params: {phone_number: { number: "1571283741",
                                                                                            person_id: @person.id} }
    assert_redirected_to @person
    assert_not flash.empty?

  end




end
