json.array!(@users) do |user|
  json.extract! user, :username, :latitude, :longitude, :radius, :current_lat, :current_longitude, :is_in_zone
  json.url user_url(user, format: :json)
end
