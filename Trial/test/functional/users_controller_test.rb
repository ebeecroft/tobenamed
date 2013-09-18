require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { 20: @user.20, 25: @user.25, 30: @user.30, 30: @user.30, admin: @user.admin, confirm: @user.confirm, email: @user.email, first_name: @user.first_name, id: @user.id, joined_on: @user.joined_on, last_name: @user.last_name, maintenance: @user.maintenance, money: @user.money, password: @user.password, timestamp: @user.timestamp, vname: @user.vname }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { 20: @user.20, 25: @user.25, 30: @user.30, 30: @user.30, admin: @user.admin, confirm: @user.confirm, email: @user.email, first_name: @user.first_name, id: @user.id, joined_on: @user.joined_on, last_name: @user.last_name, maintenance: @user.maintenance, money: @user.money, password: @user.password, timestamp: @user.timestamp, vname: @user.vname }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end