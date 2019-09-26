require 'test_helper'

class BarcodeReaderersControllerTest < ActionController::TestCase
  setup do
    @barcode_readerer = barcode_readerers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barcode_readerers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barcode_readerer" do
    assert_difference('BarcodeReaderer.count') do
      post :create, barcode_readerer: {  }
    end

    assert_redirected_to barcode_readerer_path(assigns(:barcode_readerer))
  end

  test "should show barcode_readerer" do
    get :show, id: @barcode_readerer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barcode_readerer
    assert_response :success
  end

  test "should update barcode_readerer" do
    patch :update, id: @barcode_readerer, barcode_readerer: {  }
    assert_redirected_to barcode_readerer_path(assigns(:barcode_readerer))
  end

  test "should destroy barcode_readerer" do
    assert_difference('BarcodeReaderer.count', -1) do
      delete :destroy, id: @barcode_readerer
    end

    assert_redirected_to barcode_readerers_path
  end
end
