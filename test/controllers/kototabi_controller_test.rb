require 'test_helper'

class KototabiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kototabi_index_url
    assert_response :success
  end

  test "should get show" do
    get kototabi_show_url
    assert_response :success
  end

end
