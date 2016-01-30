json.array!(@shows) do |show|
  json.extract! show, :id, :show_id, :name, :timeslot
  json.url show_url(show, format: :json)
end
