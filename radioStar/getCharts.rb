#Script to read from Billboard top 100
require 'feedjira'

url = "http://www.billboard.com/rss/charts/hot-100"
feed = Feedjira::Feed.fetch_and_parse url

#get an entry
for x in 0..99
  entry = feed.entries[x]
  puts entry.entries.entries[2]
end
