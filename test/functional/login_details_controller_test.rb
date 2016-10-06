require 'test_helper'

class LoginDetailsControllerTest < ActionController::TestCase
  setup do
    @login_detail = login_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:login_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create login_detail" do
    assert_difference('LoginDetail.count') do
      post :create, login_detail: { first_name: @login_detail.first_name, last_name: @login_detail.last_name }
    end

    assert_redirected_to login_detail_path(assigns(:login_detail))
  end

  test "should show login_detail" do
    get :show, id: @login_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @login_detail
    assert_response :success
  end

  test "should update login_detail" do
    put :update, id: @login_detail, login_detail: { first_name: @login_detail.first_name, last_name: @login_detail.last_name }
    assert_redirected_to login_detail_path(assigns(:login_detail))
  end

  test "should destroy login_detail" do
    assert_difference('LoginDetail.count', -1) do
      delete :destroy, id: @login_detail
    end

    assert_redirected_to login_details_path
  end
end
