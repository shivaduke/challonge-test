require 'test_helper'

class OtameshiControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get otameshi_index_url
    assert_response :success
  end

end
