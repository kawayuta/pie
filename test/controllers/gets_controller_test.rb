require 'test_helper'

class GetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @get = gets(:one)
  end

  test "should get index" do
    get gets_url
    assert_response :success
  end

  test "should get new" do
    get new_get_url
    assert_response :success
  end

  test "should create get" do
    assert_difference('Get.count') do
      post gets_url, params: { get: { body: @get.body, getimage: @get.getimage, price: @get.price, title: @get.title } }
    end

    assert_redirected_to get_url(Get.last)
  end

  test "should show get" do
    get get_url(@get)
    assert_response :success
  end

  test "should get edit" do
    get edit_get_url(@get)
    assert_response :success
  end

  test "should update get" do
    patch get_url(@get), params: { get: { body: @get.body, getimage: @get.getimage, price: @get.price, title: @get.title } }
    assert_redirected_to get_url(@get)
  end

  test "should destroy get" do
    assert_difference('Get.count', -1) do
      delete get_url(@get)
    end

    assert_redirected_to gets_url
  end
end
