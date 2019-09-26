require 'test_helper'

class WkBarcodesControllerTest < ActionController::TestCase
  setup do
    @wk_barcode = wk_barcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wk_barcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wk_barcode" do
    assert_difference('WkBarcode.count') do
      post :create, wk_barcode: { scandate: @wk_barcode.scandate, scantime: @wk_barcode.scantime, site: @wk_barcode.site, wid: @wk_barcode.wid }
    end

    assert_redirected_to wk_barcode_path(assigns(:wk_barcode))
  end

  test "should show wk_barcode" do
    get :show, id: @wk_barcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wk_barcode
    assert_response :success
  end

  test "should update wk_barcode" do
    patch :update, id: @wk_barcode, wk_barcode: { scandate: @wk_barcode.scandate, scantime: @wk_barcode.scantime, site: @wk_barcode.site, wid: @wk_barcode.wid }
    assert_redirected_to wk_barcode_path(assigns(:wk_barcode))
  end

  test "should destroy wk_barcode" do
    assert_difference('WkBarcode.count', -1) do
      delete :destroy, id: @wk_barcode
    end

    assert_redirected_to wk_barcodes_path
  end
end
