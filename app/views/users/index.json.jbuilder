json.array!(@users) do |user|
  json.extract! user, :id, :timestamp_id, :last_pickup.datetime
  json.url user_url(user, format: :json)
end
