require 'test_helper'

class GridControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get move" do
    get :move
    assert_response :success
  end

end
