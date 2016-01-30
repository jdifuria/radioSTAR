json.array!(@songs) do |song|
  json.extract! song, :id, :playlist_id, :title, :artist, :album, :label, :genre, :time
  json.url song_url(song, format: :json)
end
