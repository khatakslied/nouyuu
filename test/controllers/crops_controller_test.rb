require 'test_helper'

class CropsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crops_index_url
    assert_response :success
  end

  test "should get show" do
    get crops_show_url
    assert_response :success
  end

end
