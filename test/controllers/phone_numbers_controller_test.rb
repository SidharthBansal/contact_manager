require 'test_helper'

class PhoneNumbersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    log_in_as @user
    @phone = phone_numbers(:phone)
    @person = people(:nick)
    @base_title = "| ContactManager"
  end

  test "should get new" do
    get new_person_phone_number_path(@person.id)
    assert_response :success
    assert_select "title", "New Number #{@base_title}"
    assert_template 'phone_numbers/new'
  end

  test "should get create" do
    assert_difference "PhoneNumber.count", 1 do
      post person_phone_numbers_path(@person.id, @phone.id), params: { phone_number: { number: "22223333",
                                                                                       person_id: @person.id } }
    end
    assert_not flash.empty?
    assert_redirected_to @person
  end

  test "should get edit" do
    get edit_person_phone_number_path(@person.id, @phone.id)
    assert_response :success
    assert_select "title", "Edit Number #{@base_title}"
    assert_template 'phone_numbers/edit'
  end

  test "should update" do
    patch person_phone_number_path(@person.id, @phone.id), params: { phone_number: { number: "23452353",
                                                                                     person_id: @person.id } }
    assert_not flash.empty?
    assert_redirected_to @person
    @phone.reload
    assert_equal "23452353", @phone.number
  end


    test "should delete"  do
      assert_difference "PhoneNumber.count", -1 do
        delete person_phone_number_path(@person.id, @phone.id)
      end
      assert_not flash.empty?
      assert_redirected_to @person
    end



end
