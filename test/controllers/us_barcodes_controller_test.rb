require 'test_helper'

class UsBarcodesControllerTest < ActionController::TestCase
  setup do
    @us_barcode = us_barcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:us_barcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create us_barcode" do
    assert_difference('UsBarcode.count') do
      post :create, us_barcode: { scandate: @us_barcode.scandate, scantime: @us_barcode.scantime, site: @us_barcode.site, uid: @us_barcode.uid }
    end

    assert_redirected_to us_barcode_path(assigns(:us_barcode))
  end

  test "should show us_barcode" do
    get :show, id: @us_barcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @us_barcode
    assert_response :success
  end

  test "should update us_barcode" do
    patch :update, id: @us_barcode, us_barcode: { scandate: @us_barcode.scandate, scantime: @us_barcode.scantime, site: @us_barcode.site, uid: @us_barcode.uid }
    assert_redirected_to us_barcode_path(assigns(:us_barcode))
  end

  test "should destroy us_barcode" do
    assert_difference('UsBarcode.count', -1) do
      delete :destroy, id: @us_barcode
    end

    assert_redirected_to us_barcodes_path
  end
end
