json.array!(@sites) do |site|
  json.extract! site, :id, :sname
  json.url site_url(site, format: :json)
end
