json.shows @shows do |show|
  json.extract! show, :id, :name, :timeslot
end
