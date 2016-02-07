# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
load "#{Rails.root}/db/words.rb"

users = User.create(
  [
    { email: 'a@a.com', name: "Mrs. Aardvark",   password: "a", password_confirmation: "a", compliance: 10},
    { email: 'b@b.com', name: "Mrs. Bear",       password: "b", password_confirmation: "b", compliance: 15.1},
    { email: 'c@c.com', name: "Mrs. Cat",        password: "c", password_confirmation: "c", compliance: 22.12},
    { email: 'd@d.com', name: "Mrs. Dog",        password: "d", password_confirmation: "d", compliance: 24},
    { email: 'e@e.com', name: "Mrs. Elephant",   password: "e", password_confirmation: "e", compliance: 30.123},
    { email: 'f@f.com', name: "Mrs. Fox",        password: "f", password_confirmation: "f", compliance: 40.123},
    { email: 'g@g.com', name: "Mrs. Gopher",     password: "g", password_confirmation: "g", compliance: 50.12345},
    { email: 'h@h.com', name: "Mrs. Horse",      password: "h", password_confirmation: "h", compliance: 50},
    { email: 'i@i.com', name: "Mrs. Iguana",     password: "i", password_confirmation: "i", compliance: 60.123456},
    { email: 'j@j.com', name: "Mrs. Jackrabbit", password: "j", password_confirmation: "j", compliance: 60},
    { email: 'k@k.com', name: "Mrs. Kangaroo",   password: "k", password_confirmation: "k", compliance: 100},
    { email: 'l@l.com', name: "Mrs. Lama",       password: "l", password_confirmation: "l", compliance: 100},
    { email: 'm@m.com', name: "Mrs. Mouse",      password: "m", password_confirmation: "m", compliance: 100},
    { email: 'n@n.com', name: "Mrs. Numbat",     password: "n", password_confirmation: "n", compliance: 100},
    { email: 'o@o.com', name: "Mrs. Opossum",    password: "o", password_confirmation: "o", compliance: 100},
    { email: 'p@p.com', name: "Mrs. Peacock",    password: "p", password_confirmation: "p", compliance: 100},
    { email: 'q@q.com', name: "Mrs. Quail",      password: "q", password_confirmation: "q", compliance: 100},
    { email: 'r@r.com', name: "Mrs. Rabbit",     password: "r", password_confirmation: "r", compliance: 100},
    { email: 's@s.com', name: "Mrs. Snake",      password: "s", password_confirmation: "s", compliance: 100},
    { email: 't@t.com', name: "Mrs. Tiger",      password: "t", password_confirmation: "t", compliance: 100},
    { email: 'u@u.com', name: "Mrs. Urial",      password: "u", password_confirmation: "u", compliance: 100},
    { email: 'v@v.com', name: "Mrs. Vulture",    password: "v", password_confirmation: "v", compliance: 100},
    { email: 'w@w.com', name: "Mrs. Wombat",     password: "w", password_confirmation: "w", compliance: 100},
    { email: 'x@x.com', name: "Mrs. Xerox",      password: "x", password_confirmation: "x", compliance: 100},
    { email: 'y@y.com', name: "Mrs. Yak",        password: "y", password_confirmation: "y", compliance: 100},
    { email: 'z@z.com', name: "Mrs. Zebra",      password: "z", password_confirmation: "z", compliance: 100},
  ]
)

shows = Show.create(
  [
    { name: 'AB', timeslot:'MON09' },
    { name: 'BC', timeslot:'MON10' },
    { name: 'CD', timeslot:'MON14' },
    { name: 'DE', timeslot:'MON21' },
    { name: 'EF', timeslot:'TUE09' },
    { name: 'FG', timeslot:'TUE10' },
    { name: 'GH', timeslot:'TUE14' },
    { name: 'HI', timeslot:'TUE21' },
    { name: 'IJ', timeslot:'WED09' },
    { name: 'JK', timeslot:'THU10' },
    { name: 'KL', timeslot:'FRI14' },
    { name: 'LM', timeslot:'SAT21' },
    { name: 'MN', timeslot:'SUN12' },
    { name: 'NO', timeslot:'SUN14' },
    { name: 'OP', timeslot:'SUN17' },
  ]
)

userShows = UserShow.create(
  [
    {show_id: 1 , user_id: 1 },
    {show_id: 1 , user_id: 2 },
    {show_id: 2 , user_id: 2 },
    {show_id: 2 , user_id: 3 },
    {show_id: 3 , user_id: 3 },
    {show_id: 3 , user_id: 4 },
    {show_id: 4 , user_id: 4 },
    {show_id: 4 , user_id: 5 },
    {show_id: 5 , user_id: 5 },
    {show_id: 5 , user_id: 6 },
    {show_id: 6 , user_id: 6 },
    {show_id: 6 , user_id: 7 },
    {show_id: 7 , user_id: 7 },
    {show_id: 7 , user_id: 8 },
    {show_id: 8 , user_id: 8 },
    {show_id: 8 , user_id: 9 },
    {show_id: 9 , user_id: 9},
    {show_id: 9 , user_id: 10 },
    {show_id: 10 , user_id: 10 },
    {show_id: 10 , user_id: 11 },
    {show_id: 11 , user_id: 11 },
    {show_id: 11 , user_id: 12 },
    {show_id: 12 , user_id: 12 },
    {show_id: 12 , user_id: 13 },
  ]
)

charts = Chart.create(
  [
    {name:'chart1' , country:'USA' , source_url:'www.google.com' },
    {name:'chart2' , country:'USA' , source_url:'www.google.com' },
    {name:'chart3' , country:'USA' , source_url:'www.google.com' },
    {name:'chart4' , country:'USA' , source_url:'www.google.com' },
    {name:'chart5' , country:'USA' , source_url:'www.google.com' },
    {name:'chart6' , country:'USA' , source_url:'www.google.com' },
    {name:'chart7' , country:'USA' , source_url:'www.google.com' },
    {name:'chart8' , country:'USA' , source_url:'www.google.com' },
    {name:'chart9' , country:'USA' , source_url:'www.google.com' },
  ]
)

playlists = Playlist.create(
  [
    {show_id: 1, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 2, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 3, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 4, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 5, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 6, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: 7, chart_id: -1, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 1, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 2, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 3, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 4, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 5, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 6, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 7, date:DateTime.new(2009,9,1,17)},
    {show_id: -1, chart_id: 8, date:DateTime.new(2009,9,1,17)},
  ]
)

def gen_tag
  str = String.new
  len = rand(4) + 1
  for i in 1..len
    str += $words.sample + " "
  end
  return str
end

# Generate songs randomly for charts and playlists
playlists.each do |playlist|
  for i in 0..rand(4)
    Song.create(playlist_id: playlist.id, title: gen_tag, artist: gen_tag, album: gen_tag, label: gen_tag, genre: gen_tag, time:DateTime.new(2009,9,1,17))
  end
end
