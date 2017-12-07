require 'test_helper'

class HomeIntegrationTest < ActionDispatch::IntegrationTest

=begin
  def setup
    @user = users(:batman)
  end


  test "index including pagination" do
    log_in_as(@user)
    get root_path
    assert_template 'pages/home'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      person = assign(:people).first
      assert_select 'a[href=?]', person_path(person,id), text: person.name
    end
  end
=end 

end
