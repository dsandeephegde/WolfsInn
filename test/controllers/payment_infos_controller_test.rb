require 'test_helper'

class PaymentInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @payment_info = payment_infos(:one)
  end

  test "should get index" do
    get payment_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_payment_info_url
    assert_response :success
  end

  test "should create payment_info" do
    assert_difference('PaymentInfo.count') do
      post payment_infos_url, params: { payment_info: { City: @payment_info.City, Country: @payment_info.Country, SSN: @payment_info.SSN, State: @payment_info.State, billingAddress: @payment_info.billingAddress, cardNumber: @payment_info.cardNumber, customerId: @payment_info.customerId, paymentMethod: @payment_info.paymentMethod } }
    end

    assert_redirected_to payment_info_url(PaymentInfo.last)
  end

  test "should show payment_info" do
    get payment_info_url(@payment_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_payment_info_url(@payment_info)
    assert_response :success
  end

  test "should update payment_info" do
    patch payment_info_url(@payment_info), params: { payment_info: { City: @payment_info.City, Country: @payment_info.Country, SSN: @payment_info.SSN, State: @payment_info.State, billingAddress: @payment_info.billingAddress, cardNumber: @payment_info.cardNumber, customerId: @payment_info.customerId, paymentMethod: @payment_info.paymentMethod } }
    assert_redirected_to payment_info_url(@payment_info)
  end

  test "should destroy payment_info" do
    assert_difference('PaymentInfo.count', -1) do
      delete payment_info_url(@payment_info)
    end

    assert_redirected_to payment_infos_url
  end
end
