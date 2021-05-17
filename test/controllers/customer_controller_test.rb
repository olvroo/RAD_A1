require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get customer_home_url
    assert_response :success
  end

  test "should get popular" do
    get customer_popular_url
    assert_response :success
  end

  test "should get category" do
    get customer_category_url
    assert_response :success
  end

end
