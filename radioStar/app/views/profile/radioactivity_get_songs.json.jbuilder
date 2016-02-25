json.songs @playlist do |playlist|
  json.time playlist.time
  json.title playlist.title
  json.artist playlist.artist
  json.album playlist.album
  json.label playlist.label
  json.genre playlist.genre
end
