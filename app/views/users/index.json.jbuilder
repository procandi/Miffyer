json.array!(@users) do |user|
  json.extract! user, :id, :uid, :upw, :uname, :utitle, :upower, :usort
  json.url user_url(user, format: :json)
end
