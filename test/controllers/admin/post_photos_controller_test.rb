require 'test_helper'

class Admin::PostPhotosControllerTest < ActionController::TestCase
  setup do
    @admin_post_photo = admin_post_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_post_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_post_photo" do
    assert_difference('Admin::PostPhoto.count') do
      post :create, admin_post_photo: { title: @admin_post_photo.title }
    end

    assert_redirected_to admin_post_photo_path(assigns(:admin_post_photo))
  end

  test "should show admin_post_photo" do
    get :show, id: @admin_post_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_post_photo
    assert_response :success
  end

  test "should update admin_post_photo" do
    patch :update, id: @admin_post_photo, admin_post_photo: { title: @admin_post_photo.title }
    assert_redirected_to admin_post_photo_path(assigns(:admin_post_photo))
  end

  test "should destroy admin_post_photo" do
    assert_difference('Admin::PostPhoto.count', -1) do
      delete :destroy, id: @admin_post_photo
    end

    assert_redirected_to admin_post_photos_path
  end
end
