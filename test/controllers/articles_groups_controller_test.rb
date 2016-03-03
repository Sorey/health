require 'test_helper'

class ArticlesGroupsControllerTest < ActionController::TestCase
  setup do
    @articles_group = articles_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create articles_group" do
    assert_difference('ArticlesGroup.count') do
      post :create, articles_group: {  }
    end

    assert_redirected_to articles_group_path(assigns(:articles_group))
  end

  test "should show articles_group" do
    get :show, id: @articles_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @articles_group
    assert_response :success
  end

  test "should update articles_group" do
    patch :update, id: @articles_group, articles_group: {  }
    assert_redirected_to articles_group_path(assigns(:articles_group))
  end

  test "should destroy articles_group" do
    assert_difference('ArticlesGroup.count', -1) do
      delete :destroy, id: @articles_group
    end

    assert_redirected_to articles_groups_path
  end
end
