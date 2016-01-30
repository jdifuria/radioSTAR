require 'test_helper'

class UserShowsControllerTest < ActionController::TestCase
  setup do
    @user_show = user_shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_shows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_show" do
    assert_difference('UserShow.count') do
      post :create, user_show: { show_id: @user_show.show_id, user_id: @user_show.user_id }
    end

    assert_redirected_to user_show_path(assigns(:user_show))
  end

  test "should show user_show" do
    get :show, id: @user_show
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_show
    assert_response :success
  end

  test "should update user_show" do
    patch :update, id: @user_show, user_show: { show_id: @user_show.show_id, user_id: @user_show.user_id }
    assert_redirected_to user_show_path(assigns(:user_show))
  end

  test "should destroy user_show" do
    assert_difference('UserShow.count', -1) do
      delete :destroy, id: @user_show
    end

    assert_redirected_to user_shows_path
  end
end
