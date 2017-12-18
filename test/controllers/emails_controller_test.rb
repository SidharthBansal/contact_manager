require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    log_in_as(@user)
    @person = people(:nick)
    @email = emails(:email)
  end

  test "should get new" do
    get new_person_email_path(@person.id)
    assert_response :success
    assert_template 'emails/new'
  end

  test "should get create" do
    assert_difference "Email.count", 1 do
      post person_emails_path(@person.id),
                                params: { email: {
                                          email: "email@email.com",
                                          person_id: @person.id } }
    end
    assert_redirected_to @person
  end

  test "should get edit" do
    get edit_person_email_path(@person.id, @email.id)
    assert_response :success
  end

  test "should update" do
    patch person_email_path(@person.id, @email.id), params: { email: { email: "new@email.com",
                                                                       person_id: @person.id } }
    assert_not flash.empty?
    assert_redirected_to @person
    @email.reload
    assert_equal "new@email.com", @email.email
  end

  test "should get destroy" do
    assert_difference "Email.count", -1 do
      delete person_email_path(@person.id, @email.id)
    end
    assert_redirected_to @person
  end
end
