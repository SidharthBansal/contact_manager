require 'test_helper'

class EmailsFlowTest < ActionDispatch::IntegrationTest


  def setup
    @user = users(:batman)
    @other_user = users(:robin)
    @person = people(:nick)                 #=> belongs to @user
    @email = emails(:email)   #=> belongs to @person
  end

  test "should be logged in to get emails/new" do
    get new_person_email_path(@person.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should be logged in to post emails" do
    assert_no_difference 'Email.count'do
      post person_emails_path(@person.id), params: {email: { email: "1571283741" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "logged in / invalid email information" do
    log_in_as(@user)
    get new_person_email_path(@person.id)
    assert_template "emails/new"
    post person_emails_path(@person.id),
                                    params: { email: {
                                                email: "" } }
    assert_select 'div#error_explanation'
    assert_template "emails/new"
  end

  test "GET emails/new as wrong user" do
    log_in_as(@other_user)
    get new_person_email_path(@person.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "valid email information wrong user" do
    log_in_as(@other_user)
    assert_no_difference 'Email.count' do
      post person_emails_path(@person.id), params: {email: { email: "good@example.com" } }
    end
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "logged in as right user / valid email information" do
    log_in_as(@user)
    get new_person_email_path(@person.id)
    assert_template 'emails/new'
    assert_difference 'Email.count', 1 do
      post person_emails_path(@person.id), params: {email: { email: "good@example.com" } }
    end
    assert_not flash.empty?
    assert_redirected_to @person
  end

  test "should be logged in to get emails/edit" do
    get edit_person_email_path(@person.id, @email.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "should be logged in to patch emails" do
    patch person_email_path(@person.id, @email.id),
                                     params: { email: { email: "good@example.com" } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "invalid edit information (logged in) " do
    log_in_as(@user)
    get edit_person_email_path(@person.id, @email.id)
    assert_template "emails/edit"
    patch person_email_path(@person.id, @email.id),
                                    params: { email: { email: "" } }
    assert_select 'div#error_explanation'
    assert_template "emails/edit"
  end

  test "GET emails/edit as wrong user" do
    log_in_as(@other_user)
    get edit_person_email_path(@person.id, @email.id)
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "UPDATE email as wrong user" do
    log_in_as(@other_user)
    patch person_email_path(@person.id, @email.id), params: {email: { email: "good@example.com" } }
    assert_not flash.empty?
    assert_redirected_to login_path
  end

  test "successful edit" do
    log_in_as(@user)
    email = @person.emails.create(email: "good@example.com")
    get edit_person_email_path(@person.id, email.id)
    assert_template 'emails/edit'
    patch person_email_path(@person.id, email.id), params: {email: { email: "edit@example.com",
                                                                     person_id: @person.id} }
    assert_redirected_to @person
    assert_not flash.empty?

  end



end
