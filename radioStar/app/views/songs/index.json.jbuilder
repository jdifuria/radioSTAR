json.array!(@songs) do |song|
  json.extract! song, :id, :title, :artist, :album, :label, :genre, :time
end
