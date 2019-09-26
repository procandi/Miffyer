json.array!(@wk_barcodes) do |wk_barcode|
  json.extract! wk_barcode, :id, :wid, :site, :scandate, :scantime
  json.url wk_barcode_url(wk_barcode, format: :json)
end
