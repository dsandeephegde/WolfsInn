require 'test_helper'

class ServesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @serf = serves(:one)
  end

  test "should get index" do
    get serves_url
    assert_response :success
  end

  test "should get new" do
    get new_serf_url
    assert_response :success
  end

  test "should create serf" do
    assert_difference('Serve.count') do
      post serves_url, params: { serf: { checkinId: @serf.checkinId, staffId: @serf.staffId } }
    end

    assert_redirected_to serf_url(Serve.last)
  end

  test "should show serf" do
    get serf_url(@serf)
    assert_response :success
  end

  test "should get edit" do
    get edit_serf_url(@serf)
    assert_response :success
  end

  test "should update serf" do
    patch serf_url(@serf), params: { serf: { checkinId: @serf.checkinId, staffId: @serf.staffId } }
    assert_redirected_to serf_url(@serf)
  end

  test "should destroy serf" do
    assert_difference('Serve.count', -1) do
      delete serf_url(@serf)
    end

    assert_redirected_to serves_url
  end
end
