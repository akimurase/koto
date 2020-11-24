require 'test_helper'

class ItinerarysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get itinerarys_index_url
    assert_response :success
  end

  test "should get new" do
    get itinerarys_new_url
    assert_response :success
  end

  test "should get create" do
    get itinerarys_create_url
    assert_response :success
  end

  test "should get edit" do
    get itinerarys_edit_url
    assert_response :success
  end

  test "should get update" do
    get itinerarys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get itinerarys_destroy_url
    assert_response :success
  end

end
