require 'test_helper'

class RampPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ramp_pages_index_url
    assert_response :success
  end

  test "should get show" do
    get ramp_pages_show_url
    assert_response :success
  end

  test "should get new" do
    get ramp_pages_new_url
    assert_response :success
  end

  test "should get edit" do
    get ramp_pages_edit_url
    assert_response :success
  end

  test "should get delete" do
    get ramp_pages_delete_url
    assert_response :success
  end

end
