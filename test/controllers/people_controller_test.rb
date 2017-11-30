require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  def setup
    @person = people(:nick)
    @base_title = "| ContactManager"
  end

  test "should get index" do
    get root_path
    assert_response :success
    assert_template 'people/index'
    assert_select 'title',  "Index #{@base_title}"
  end

  test "should get show" do
    get person_path(@person.id)
    assert_response :success
    assert_template 'people/show'
    assert_select 'title',  "Contact #{@base_title}"
  end

  test "should get new" do
    get new_person_path
    assert_response :success
    assert_template 'people/new'
    assert_select 'title',  "New Contact #{@base_title}"
  end

  test "should get edit" do
    get edit_person_path(@person.id)
    assert_response :success
    assert_template 'people/edit'
    assert_select 'title',  "Edit #{@base_title}"
  end

end

=begin

root          GET    /                          people#index
people        POST   /people(.:format)          people#create
new_person    GET    /people/new(.:format)      people#new
edit_person   GET    /people/:id/edit(.:format) people#edit
person        GET    /people/:id(.:format)      people#show
              PATCH  /people/:id(.:format)      people#update
              PUT    /people/:id(.:format)      people#update
              DELETE /people/:id(.:format)      people#destroy
=end
