json.array!(@songs) do |song|
  json.extract! song, :id, :playlist_id, :title, :artist, :album, :label, :genre, :time
end
