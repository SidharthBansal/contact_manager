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
                                            email: "email@email.com" } }
    end
    assert_redirected_to @person
  end

  test "should get edit" do
    get edit_person_email_path(@person.id, @email.id)
    assert_response :success
  end

=begin
  test "should update" do
    patch person_email_path(@person.id, @email.id),
                              params: { email: {
                                          email: "newemail@email.com" } }
    assert_redirected_to @person
  end
=end

  test "should get destroy" do
    assert_difference "Email.count", -1 do
      delete person_email_path(@person.id, @email.id)
    end
    assert_redirected_to @person
  end
end

=begin

ERROR["test_should_get_destroy", EmailsControllerTest, 1.5047571690010955]
 test_should_get_destroy#EmailsControllerTest (1.50s)
ActionController::ActionControllerError:         ActionController::ActionControllerError: Cannot redirect to nil!
            app/controllers/emails_controller.rb:36:in `destroy'
            test/controllers/emails_controller_test.rb:43:in `block (2 levels) in <class:EmailsControllerTest>'
            test/controllers/emails_controller_test.rb:42:in `block in <class:EmailsControllerTest>'
=end
