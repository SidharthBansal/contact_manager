require 'test_helper'

class EmailsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:batman)
    log_in_as(@user)
    @person = people(:nick)
    @email = emails(:email)
  end

  test "should get new" do
    get new_email_path(person: @person)
    assert_response :success
    assert_template 'emails/new'
  end
=begin
  test "should get create" do
    person = assigns(:person)
    post emails_path, params: {email: {
                                  email: "email@email.com",
                                  person_id: person.id
                                  }
                                }
    assert_response :success
  end
=end
  test "should get edit" do
    get edit_email_path(@email.id, person: @person)
    assert_response :success
  end
=begin
  test "should get update" do
    person = assigns(:person)
    patch email_path(@email.id), params: {email: {
                                            email: "newemail@email.com",
                                            person_id: person.id
                                            }
                                          }
    assert_response :success
  end

  test "should get destroy" do
    assert_difference "Email.count", 1 do
      delete email_path(@email.id)
    end

  end
=end
end
