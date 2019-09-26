require 'test_helper'

class PtBarcodesControllerTest < ActionController::TestCase
  setup do
    @pt_barcode = pt_barcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pt_barcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pt_barcode" do
    assert_difference('PtBarcode.count') do
      post :create, pt_barcode: { pid: @pt_barcode.pid, scandate: @pt_barcode.scandate, scantime: @pt_barcode.scantime, site: @pt_barcode.site }
    end

    assert_redirected_to pt_barcode_path(assigns(:pt_barcode))
  end

  test "should show pt_barcode" do
    get :show, id: @pt_barcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pt_barcode
    assert_response :success
  end

  test "should update pt_barcode" do
    patch :update, id: @pt_barcode, pt_barcode: { pid: @pt_barcode.pid, scandate: @pt_barcode.scandate, scantime: @pt_barcode.scantime, site: @pt_barcode.site }
    assert_redirected_to pt_barcode_path(assigns(:pt_barcode))
  end

  test "should destroy pt_barcode" do
    assert_difference('PtBarcode.count', -1) do
      delete :destroy, id: @pt_barcode
    end

    assert_redirected_to pt_barcodes_path
  end
end
