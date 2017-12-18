require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    log_in_as @user
    @person = people(:nick)
    @base_title = "| ContactManager"
    @address = addresses(:delhi)
  end

  test "should get new" do
    get new_person_address_path(@person.id)
    assert_response :success
    assert_select "title", "New Address #{@base_title}"
  end


  test "should get create" do
    assert_difference "Address.count", 1 do
      post person_addresses_path(@person.id), params: { address: { address: "House No 40",
                                                                   city: "Delhi",
                                                                   state: "Delhi",
                                                                   country: "India",
                                                                   postcode: 199293,
                                                                   person_id: @person.id } }
    end
    assert_not flash.empty?
    assert_redirected_to @person
  end

  test "should get edit" do
    get edit_person_address_path(@person.id, @address.id)
    assert_response :success
    assert_select "title", "Edit Address #{@base_title}"
  end

  test "should get update" do
    log_in_as(@user)
    get edit_person_address_path(@person.id, @address.id)
    patch person_address_path(@person.id, @address.id), params: { address: { address: "House No 41",
                                                                             city: "New York",
                                                                             state: "New Delhi",
                                                                             postcode: 324155,
                                                                             country: "India",
                                                                             person_id: @person.id } }
    assert_not flash.empty?
    assert_redirected_to @person
    @address.reload
    assert_equal "House No 41", @address.address
    assert_equal "New York", @address.city
  end
=begin
FAIL["test_should_get_update", AddressesControllerTest, 1.633212443033699]
test_should_get_update#AddressesControllerTest (1.63s)
       Expected response to be a redirect to <http://www.example.com/people/1/addresses/1055861687> but was a redirect to <http://www.example.com/people/1>.
       Expected "http://www.example.com/people/1/addresses/1055861687" to be === "http://www.example.com/people/1".
       test/controllers/addresses_controller_test.rb:50:in `block in <class:AddressesControllerTest>'

 102/102: [==============================================================================================] 100% Time: 00:00:03, Time: 00:00:03




=end
end
