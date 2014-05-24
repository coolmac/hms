require 'test_helper'

class FavouritePrescriptionsControllerTest < ActionController::TestCase
  test "should get index_" do
    get :index_
    assert_response :success
  end

end
