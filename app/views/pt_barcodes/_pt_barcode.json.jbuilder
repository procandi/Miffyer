json.extract! pt_barcode, :id, :pid, :site, :scandate, :scantime, :created_at, :updated_at
json.url pt_barcode_url(pt_barcode, format: :json)
