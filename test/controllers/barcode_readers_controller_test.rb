require 'test_helper'

class BarcodeReadersControllerTest < ActionController::TestCase
  setup do
    @barcode_reader = barcode_readers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:barcode_readers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create barcode_reader" do
    assert_difference('BarcodeReader.count') do
      post :create, barcode_reader: {  }
    end

    assert_redirected_to barcode_reader_path(assigns(:barcode_reader))
  end

  test "should show barcode_reader" do
    get :show, id: @barcode_reader
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @barcode_reader
    assert_response :success
  end

  test "should update barcode_reader" do
    patch :update, id: @barcode_reader, barcode_reader: {  }
    assert_redirected_to barcode_reader_path(assigns(:barcode_reader))
  end

  test "should destroy barcode_reader" do
    assert_difference('BarcodeReader.count', -1) do
      delete :destroy, id: @barcode_reader
    end

    assert_redirected_to barcode_readers_path
  end
end
