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
    { email: 'a@a.com', name: "Mrs. Aardvark",   password: "a", password_confirmation: "a",  station_id: 1, admin:"t"},
    { email: 'b@b.com', name: "Mrs. Bear",       password: "b", password_confirmation: "b",  station_id: 2, admin:"t"},
    { email: 'c@c.com', name: "Mrs. Cat",        password: "c", password_confirmation: "c",  station_id: 3, admin:"t"},
    { email: 'd@d.com', name: "Mrs. Dog",        password: "d", password_confirmation: "d",  station_id: 4, admin:"f"},
    { email: 'e@e.com', name: "Mrs. Elephant",   password: "e", password_confirmation: "e",  station_id: 1, admin:"f"},
    { email: 'f@f.com', name: "Mrs. Fox",        password: "f", password_confirmation: "f",  station_id: 1, admin:"f"},
    { email: 'g@g.com', name: "Mrs. Gopher",     password: "g", password_confirmation: "g",  station_id: 1, admin:"f"},
    { email: 'h@h.com', name: "Mrs. Horse",      password: "h", password_confirmation: "h",  station_id: 1, admin:"f"},
    { email: 'i@i.com', name: "Mrs. Iguana",     password: "i", password_confirmation: "i",  station_id: 1, admin:"f"},
    { email: 'j@j.com', name: "Mrs. Jackrabbit", password: "j", password_confirmation: "j",  station_id: 1, admin:"f"},
    { email: 'k@k.com', name: "Mrs. Kangaroo",   password: "k", password_confirmation: "k",  station_id: 1, admin:"f"},
    { email: 'l@l.com', name: "Mrs. Lama",       password: "l", password_confirmation: "l",  station_id: 1, admin:"f"},
    { email: 'm@m.com', name: "Mrs. Mouse",      password: "m", password_confirmation: "m",  station_id: 1, admin:"f"},
    { email: 'n@n.com', name: "Mrs. Numbat",     password: "n", password_confirmation: "n",  station_id: 1, admin:"f"},
    { email: 'o@o.com', name: "Mrs. Opossum",    password: "o", password_confirmation: "o",  station_id: 1, admin:"f"},
    { email: 'p@p.com', name: "Mrs. Peacock",    password: "p", password_confirmation: "p",  station_id: 1, admin:"f"},
    { email: 'q@q.com', name: "Mrs. Quail",      password: "q", password_confirmation: "q",  station_id: 1, admin:"f"},
    { email: 'r@r.com', name: "Mrs. Rabbit",     password: "r", password_confirmation: "r",  station_id: 1, admin:"f"},
    { email: 's@s.com', name: "Mrs. Snake",      password: "s", password_confirmation: "s",  station_id: 1, admin:"f"},
    { email: 't@t.com', name: "Mrs. Tiger",      password: "t", password_confirmation: "t",  station_id: 1, admin:"f"},
    { email: 'u@u.com', name: "Mrs. Urial",      password: "u", password_confirmation: "u",  station_id: 1, admin:"f"},
    { email: 'v@v.com', name: "Mrs. Vulture",    password: "v", password_confirmation: "v",  station_id: 1, admin:"f"},
    { email: 'w@w.com', name: "Mrs. Wombat",     password: "w", password_confirmation: "w",  station_id: 1, admin:"f"},
    { email: 'x@x.com', name: "Mrs. Xerox",      password: "x", password_confirmation: "x",  station_id: 1, admin:"f"},
    { email: 'y@y.com', name: "Mrs. Yak",        password: "y", password_confirmation: "y",  station_id: 1, admin:"f"},
    { email: 'z@z.com', name: "Mrs. Zebra",      password: "z", password_confirmation: "z",  station_id: 1, admin:"f"},
    { email: 'rpm@kcscradio.com', name: "RPM Director", password: 'rpm', password_confirmation: 'rpm', station_id: 1, admin:"t"}
  ]
)

shows = Show.create(
  [
    { name: 'AB', timeslot:'MON09', station_id: 1, compliance: 100  },
    { name: 'BC', timeslot:'MON10', station_id: 1, compliance: 100  },
    { name: 'CD', timeslot:'MON14', station_id: 1, compliance: 100  },
    { name: 'DE', timeslot:'MON21', station_id: 1, compliance: 95.2  },
    { name: 'EF', timeslot:'TUE09', station_id: 1, compliance: 95.2  },
    { name: 'FG', timeslot:'TUE10', station_id: 1, compliance: 95.2  },
    { name: 'GH', timeslot:'TUE14', station_id: 1, compliance: 95.2  },
    { name: 'HI', timeslot:'TUE21', station_id: 1, compliance: 50.11  },
    { name: 'IJ', timeslot:'WED09', station_id: 1, compliance: 50.11  },
    { name: 'JK', timeslot:'THU10', station_id: 1, compliance: 50.11  },
    { name: 'KL', timeslot:'FRI14', station_id: 1, compliance: 50.11  },
    { name: 'LM', timeslot:'SAT21', station_id: 1, compliance: 50.11  },
    { name: 'MN', timeslot:'SUN12', station_id: 2, compliance: 83.5  },
    { name: 'NO', timeslot:'SUN14', station_id: 3, compliance: 83.5  },
    { name: 'OP', timeslot:'SUN17', station_id: 4, compliance: 83.5  },
  ]
)

userShows = UserShow.create(
  [
    {show_id: 1 , user_id: 1 },
    {show_id: 1 , user_id: 11 },
    {show_id: 2 , user_id: 12 },
    {show_id: 2 , user_id: 13 },
    {show_id: 3 , user_id: 14 },
    {show_id: 3 , user_id: 15 },
    {show_id: 4 , user_id: 16 },
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
    {show_id: 10 , user_id: 2 },
    {show_id: 11 , user_id: 3 },
    {show_id: 12 , user_id: 4 },
  ]
)

charts = Chart.create(
  [
    {name:'Top 100' , country:'USA' , source_url:'http://www.billboard.com/rss/charts/hot-100', station_id: 1 },
    {name:'Hip Hop' , country:'USA' , source_url:'http://www.billboard.com/charts#id-chart-category-rbhip-hop', station_id: 1 },
    {name:'Pop' , country:'USA' , source_url:'http://www.billboard.com/charts#id-chart-category-pop', station_id: 1 },
    {name:'Dance/Electronic' , country:'USA' , source_url:'http://www.billboard.com/charts#id-chart-category-danceelectronic', station_id: 2 },
    {name:'Country' , country:'USA' , source_url:'http://www.billboard.com/charts#id-chart-category-country', station_id: 1 },
    {name:'Rock' , country:'USA' , source_url:'whttp://www.billboard.com/charts#id-chart-category-rock', station_id: 1 },
    {name:'chart7' , country:'USA' , source_url:'www.google.com', station_id: 2 },
    {name:'chart8' , country:'USA' , source_url:'www.google.com', station_id: 3 },
    {name:'chart9' , country:'USA' , source_url:'www.google.com', station_id: 4 },
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

stations = Station.create(
  [
    {user_id: 1, station_name: "KCSC", station_url: "kcscradio.com", message_of_the_day: "Welcome to KCSC Radio!!!"},
    {user_id: 2, station_name: "KCFR", station_url: "kcfrradio.com", message_of_the_day: "Welcome to KCFR Radio!!!"},
    {user_id: 3, station_name: "KQED", station_url: "kqedradio.com", message_of_the_day: "Welcome to KQED Radio!!!"},
    {user_id: 4, station_name: "KQEI", station_url: "kqeiradio.com", message_of_the_day: "Welcome to KQEI Radio!!!"},
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
