require 'test_helper'


class SiteLayoutTest < ActionDispatch::IntegrationTest
    
  def setup
    @admin = users(:michael)
    @non_admin = users(:archer)
  end
  
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
    
  test "layout links as admin" do
    log_in_as(@admin)
    get user_path(@admin)
    assert_template 'users/show'
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
  
  test "layout links as non-admin" do
    log_in_as(@non_admin)
    get user_path(@non_admin)
    assert_template 'users/show'
    get users_path
    assert_template 'users/index'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
    
end
