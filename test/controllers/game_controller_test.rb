require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get play" do
    get :play
    assert_response :success
  end

  test "should get beginner" do
    get :beginner
    assert_response :success
  end

  test "should get tutorial" do
    get :tutorial
    assert_response :success
  end

end
