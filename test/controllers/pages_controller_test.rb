require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get for-restaurants" do
    get pages_for-restaurants_url
    assert_response :success
  end

  test "should get faq" do
    get pages_faq_url
    assert_response :success
  end

  test "should get contact" do
    get pages_contact_url
    assert_response :success
  end

  test "should get privacy-policy" do
    get pages_privacy-policy_url
    assert_response :success
  end

  test "should get terms-of-service" do
    get pages_terms-of-service_url
    assert_response :success
  end

end
