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
                                                                   postcode: 199293 } }
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
                                                                             country: "India"
                                                                              } }
    assert_template 'edit'
    @address.reload
    assert_equal "House No 41", @address.address
    assert_equal "New York", @address.city

  end
=begin

test "successful update" do
  log_in_as(@user)
  get edit_user_path(@user.id)
  patch user_path(@user.id), params: { user: { username: "lemon",
                                                email: "lemonade@email.com",
                                                password: "foobar",
                                                password_confirmation: "foobar" } }
  assert_not flash.empty?
  assert_redirected_to @user
end

:address, :city, :state, :postcode, :country

delhi:
  address: House No 40
  postcode: 199293
  city: Delhi
  country: India
  state: Delhi

  test "should get delete" do
    get person_address(@person.id)
    assert_response :success
  end
=end
end
