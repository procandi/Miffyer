json.array!(@rf_barcodes) do |rf_barcode|
  json.extract! rf_barcode, :id, :rid, :site, :scandate, :scantime
  json.url rf_barcode_url(rf_barcode, format: :json)
end
