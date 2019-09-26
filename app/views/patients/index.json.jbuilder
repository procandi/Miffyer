json.array!(@patients) do |patient|
  json.extract! patient, :id, :pid, :pname, :birthday, :sex, :telephone, :address
  json.url patient_url(patient, format: :json)
end
