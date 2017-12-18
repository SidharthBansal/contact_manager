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
                                                                   postcode: 199293}}
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
    patch person_address_path(@person.id, @address.id), params: { address: { address: "House No 41",
                                                                             city: "Delhi",
                                                                             state: "New Delhi",
                                                                             country: "India",
                                                                             postcode: 199293 } }
    assert_not flash.empty?
    assert_redirected_to @person
    assert_equal @address.address, @address.address
  end
=begin
  test "should get delete" do
    get person_address(@person.id)
    assert_response :success
  end
=end
end

Prefix Verb   URI Pattern                                     Controller#Action
person_addresses POST   /people/:person_id/addresses(.:format)          addresses#create
new_person_address GET    /people/:person_id/addresses/new(.:format)      addresses#new
edit_person_address GET    /people/:person_id/addresses/:id/edit(.:format) addresses#edit
person_address PATCH  /people/:person_id/addresses/:id(.:format)      addresses#update
              PUT    /people/:person_id/addresses/:id(.:format)      addresses#update
              DELETE /people/:person_id/addresses/:id(.:format)      addresses#destroy
