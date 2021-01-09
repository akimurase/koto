require 'test_helper'

class KototabisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kototabis_index_url
    assert_response :success
  end

  test "should get show_top" do
    get kototabis_show_top_url
    assert_response :success
  end

  test "should get show_product" do
    get kototabis_show_product_url
    assert_response :success
  end

  test "should get show_about" do
    get kototabis_show_about_url
    assert_response :success
  end

end
