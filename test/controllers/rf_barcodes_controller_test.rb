require 'test_helper'

class RfBarcodesControllerTest < ActionController::TestCase
  setup do
    @rf_barcode = rf_barcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rf_barcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rf_barcode" do
    assert_difference('RfBarcode.count') do
      post :create, rf_barcode: { rid: @rf_barcode.rid, scandate: @rf_barcode.scandate, scantime: @rf_barcode.scantime, site: @rf_barcode.site }
    end

    assert_redirected_to rf_barcode_path(assigns(:rf_barcode))
  end

  test "should show rf_barcode" do
    get :show, id: @rf_barcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rf_barcode
    assert_response :success
  end

  test "should update rf_barcode" do
    patch :update, id: @rf_barcode, rf_barcode: { rid: @rf_barcode.rid, scandate: @rf_barcode.scandate, scantime: @rf_barcode.scantime, site: @rf_barcode.site }
    assert_redirected_to rf_barcode_path(assigns(:rf_barcode))
  end

  test "should destroy rf_barcode" do
    assert_difference('RfBarcode.count', -1) do
      delete :destroy, id: @rf_barcode
    end

    assert_redirected_to rf_barcodes_path
  end
end
