#Script to read from Billboard top 100
require 'feedjira'

#array declaration
topSongs = Array.new
topArtists = Array.new

#Feedjira fetch
url = "http://www.billboard.com/rss/charts/hot-100"
feed = Feedjira::Feed.fetch_and_parse url

#grab date for chart
entry = feed.entries[1]
date = entry.entries[4][1]

#get an entry
for x in 0..99
  #get current song info
  song = Array.new
  summary = Array.new
  entry = feed.entries[x]
  curSong = entry.entries[0][1]

  #Remove excess info from song
  curSong.slice! (/[0-9]+: /)
  song.push(curSong)
  topSongs.push(song)

  ## process summary information ##
  #pull next summary into var
  curSummary = entry.entries[2][1]

  #slice title and "by" off
  curSummary.slice! curSong
  curSummary.slice! (/ by /)

  #chomp ranks off
  curSummary.slice! (" ranks ")
  curSummary.slice! (/\#[0-9]+/)

  # add artist to list
  summary.push(curSummary)
  topArtists.push(summary)
end

#print final results
for x in 0..99
  puts
  puts topSongs[x]
  puts topArtists[x]
end

puts date
