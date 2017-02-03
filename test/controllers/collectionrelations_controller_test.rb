require 'test_helper'

class CollectionrelationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collectionrelation = collectionrelations(:one)
  end

  test "should get index" do
    get collectionrelations_url
    assert_response :success
  end

  test "should get new" do
    get new_collectionrelation_url
    assert_response :success
  end

  test "should create collectionrelation" do
    assert_difference('Collectionrelation.count') do
      post collectionrelations_url, params: { collectionrelation: { detaile: @collectionrelation.detaile, name: @collectionrelation.name } }
    end

    assert_redirected_to collectionrelation_url(Collectionrelation.last)
  end

  test "should show collectionrelation" do
    get collectionrelation_url(@collectionrelation)
    assert_response :success
  end

  test "should get edit" do
    get edit_collectionrelation_url(@collectionrelation)
    assert_response :success
  end

  test "should update collectionrelation" do
    patch collectionrelation_url(@collectionrelation), params: { collectionrelation: { detaile: @collectionrelation.detaile, name: @collectionrelation.name } }
    assert_redirected_to collectionrelation_url(@collectionrelation)
  end

  test "should destroy collectionrelation" do
    assert_difference('Collectionrelation.count', -1) do
      delete collectionrelation_url(@collectionrelation)
    end

    assert_redirected_to collectionrelations_url
  end
end
