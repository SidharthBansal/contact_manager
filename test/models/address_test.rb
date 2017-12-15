require 'test_helper'

class AddressTest < ActiveSupport::TestCase


  def setup
    @person = people(:nick)
    @address = Address.new(address: "Big Fat Rd.", city: "East Delhi",
                           state: "New Delhi", country: "India",
                           postcode: "110051", person_id: @person.id )
  end

  test "should be valid" do
    assert @address.valid?
  end

  test "postcode should be at least 4 chr long" do
    @address.postcode = ("1" * 4).to_i
  end

  test "postcode shouldn't be longer that 8 char" do
    @address.postcode = ("1" * 9).to_i
    assert_not @address.valid?
  end

  test "state should not be greater than 15 chars long" do
    @address.state = "a"*16
    assert_not @address.valid?
  end

  test "city should not be greater than 15 char long" do
    @address.city = "a" * 16
    assert_not @address.valid?
  end

  test "country should not be greater than 15 char long" do
    @address.country = "a"*16
    assert_not @address.valid?
  end

  test "city names shouldnt contain numbers or symbols" do
    bad_city_names = ["N3w Delhi", "N*w Delhi"]
    bad_city_names.each do |name|
      @address.city = name
      assert_not @address.valid?
    end
  end

  test "state names shouldn't contain numbers or symbols" do
    bad_state_names = ["n3fak", "ast*", "fajk&agd"]
    bad_state_names.each do |name|
      @address.state = name
      assert_not @address.valid?
    end
  end

  test "country names shouldnt contain numbers or symbols" do
    bad_country_names = ["!nda", "1ndia", "Un1ted States", "Un!ted States"]
    bad_country_names.each do |name|
      @address.country = name
      assert_not @address.valid?
    end
  end


end
