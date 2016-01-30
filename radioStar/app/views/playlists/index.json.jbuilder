json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :show_id, :chart_id, :playlist_id, :date
  json.url playlist_url(playlist, format: :json)
end
