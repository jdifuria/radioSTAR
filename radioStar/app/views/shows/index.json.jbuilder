json.array!(@shows) do |show|
  json.extract! show, :id, :show_id, :name, :timeslot
end
