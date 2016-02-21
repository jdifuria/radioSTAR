#Script to read from Billboard top 100
require 'feedjira'

#class declaration for info
# class Song
#   def initiliaze(title)
#     @songTitle = title
#   end
# end

#array declaration
topSongs = Array.new
topSummaries = Array.new

#Feedjira fetch
url = "http://www.billboard.com/rss/charts/hot-100"
feed = Feedjira::Feed.fetch_and_parse url



#get an entry
for x in 0..99
  #get current song info
  song = Array.new
  summary = Array.new
  entry = feed.entries[x]
  song.push(entry.entries[0][1])
  summary.push(entry.entries[2][1])
  topSongs.push(song)
  topSummaries.push(summary)
end

for x in 0..99
  puts
  puts topSongs[x]
  puts topSummaries[x]
end

puts
