require 'test_helper'

class UsersModelsControllerTest < ActionController::TestCase
  setup do
    @users_model = users_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_model" do
    assert_difference(UsersModel.count) do
      post :create, users_model: { count: @users_model.count, password: @users_model.password, user: @users_model.user }
    end

    assert_redirected_to users_model_path(assigns(:users_model))
  end

  test "should show users_model" do
    get :show, id: @users_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_model
    assert_response :success
  end

  test "should update users_model" do
    put :update, id: @users_model, users_model: { count: @users_model.count, password: @users_model.password, user: @users_model.user }
    assert_redirected_to users_model_path(assigns(:users_model))
  end

  test "should destroy users_model" do
    assert_difference(UsersModel.count, -1) do
      delete :destroy, id: @users_model
    end

    assert_redirected_to users_models_path
  end
end
