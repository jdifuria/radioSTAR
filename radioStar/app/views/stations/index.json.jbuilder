json.array!(@stations) do |station|
  json.extract! station, :id, :user_id, :station_id, :station_name, :station_url
  json.url station_url(station, format: :json)
end
