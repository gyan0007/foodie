require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :redirect
  end

end
