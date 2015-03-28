require 'test_helper'

class CodesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  # codes#index
  test "render codes index for admins" do
    admin = users(:admin)
    sign_in admin
    get :index
    assert_response :success, "Failed to show code index to admin user"
  end

  test "protect codes index from non-admins" do
    user = users(:user)
    sign_in user
    get :index
    assert_redirected_to root_path, "Showed code index to non-admin user"
  end

  # codes#new
  test "render new code form for admins" do
    admin = users(:admin)
    sign_in admin
    get :new
    assert_response :success, "Failed to show new code form to admin user"
  end

  test "protect new code form from non-admins" do
    user = users(:user)
    sign_in user
    get :new
    assert_redirected_to root_path, "Showed new code form to non-admin user"
  end

  # codes#create
  test "create new code for admins" do
    admin = users(:admin)
    sign_in admin
    assert_difference "Code.count", 1, "Failed to create code for an admin user" do
      put :create, code: {title: "Code Title", message: "Code message",
        status: "Code Status"}
    end
  end

  test "protect code creation from non-admins" do
    user = users(:user)
    sign_in user
    assert_no_difference "Code.count", "Created code for a non-admin user" do
      put :create, code: {title: "Code Title", message: "Code message",
        status: "Code Status"}
    end
  end

  # codes#edit
  test "render edit code form for admins" do
    admin = users(:admin)
    sign_in admin
    get :edit, id: codes(:code).id
    assert_response :success, "Failed to show edit code form to admin user"
  end

  test "protect edit code form from non-admins" do
    user = users(:user)
    sign_in user
    get :edit, id: codes(:code).id
    assert_redirected_to root_path, "Showed edit code form to non-admin user"
  end

  # codes#update
  test "update code for admins" do
    admin = users(:admin)
    sign_in admin
    put :update, id: codes(:code).id, code: {title: "Different title"}
    assert_equal "Different title", Code.find(codes(:code).id).title,
      "Failed to update code for an admin user"
  end

  test "protect code update from non-admins" do
    user = users(:user)
    sign_in user
    put :update, id: codes(:code).id, code: {title: "Different title"}
    assert_redirected_to root_path, "Updated code for a non-admin user"
  end

  # codes#destroy
  test "destroy code for admins" do
    admin = users(:admin)
    sign_in admin
    assert_difference "Code.count", -1, "Failed to destroy code for an admin" do
      delete :destroy, id: codes(:code_to_be_destroyed_1).id
    end
  end

  test "protect code destruction from non-admins" do
    user = users(:user)
    sign_in user
    assert_no_difference "Code.count", "Destroyed code for a non-admin user" do
      delete :destroy, id: codes(:code_to_be_destroyed_2).id
    end
  end
end
