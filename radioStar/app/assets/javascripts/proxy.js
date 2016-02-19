var querystring = require('querystring');
var http = require('http');
var fs = require('fs');
var passport = require('passport');
var url = require('url');
var fs = require('fs');
var Song = require('../app/models/ListSchema');
var Account = require('../app/models/AccountSchema');
var Show = require('../app/models/ShowSchema');

function Proxy(email, password) {
  this.email = email;
  this.password = password;
  this.playlist_id = '';
}

Proxy.prototype.edit = function(playlist_id) {

  this.playlist_id = playlist_id;
  return this.login(this.set_edit_data, this.set_edit_options, this.edit_callback);

},//<-------------- END Edit ----------------- ||

Proxy.prototype.upload = function(playlist_id) {
  console.log('Starting upload of playlist %s to Radioactivity', playlist_id);
  this.playlist_id = playlist_id;
  return this.login(this.set_upload_data, this.set_upload_options, this.upload_callback);

}//<--------- END Upload -----------||

Proxy.prototype.login = function (set_data, set_options, callback) {

   console.log('Logging into radioactivity as %s', this.email);

    var cookie = '';
    var that = this;

    var login_data = querystring.stringify({
      youremail: this.email,
      yourpassword: this.password,
      submitted: 1
    });

    var login_options = {
      host: 'kcsc.radioactivity.fm',
      port: 80,
      path: '/login.html?',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(login_data)
      }
    }

    login_callback = function(response) {
      var str = '';
      if(response.statusCode == 200) {
        response.setEncoding('utf8');
        cookie = response.headers['set-cookie'][response.headers['set-cookie'].length - 1];
        cookie = cookie.split(";");
        cookie = cookie[0];
        console.log('Radioactivity cookie: %s', cookie);
        that.convert_parameters(cookie, set_data, set_options, callback);
      }
      else
        cookie = '-1';
    }

    var req = http.request(login_options, login_callback);
    req.write(login_data);
    req.end();

  } //<------------ END login --------------||

  Proxy.prototype.convert_parameters = function(cookie, set_data, set_options, callback) {

    var that = this;

    if(!cookie || cookie == '') {
      console.log('Warning: Cookie not set');
      return -1;
    }

    console.log('Grabbing playlist %s from database', this.playlist_id);

    PlayList.findOne({ _id : this.playlist_id }).exec(function(error, nList) {
      if(error) {
        console.log('Warning: Unable to retrieve playlist from database');
        return undefined;
      }
      else if (nList) {
        console.log('Converting playlist %s parameters', nList._id);
        var params;
        var genre = '';
        var ampm = 'am';
        var artist = '';
        var song = '';
        var album = '';
        var label = '';
        var hours = nList.log_date.getHours();
        var minutes = nList.log_date.getMinutes();
        var month = nList.log_date.getMonth();
        var day = nList.log_date.getDay();
        var year = nList.log_date.getFullYear();
        var ra_id = '';

        console.log('nList.log_date: ', nList.log_date);

        if(hours == 0){
          hours=12;
        }
        else if(hours>12) {
          hours=hours%12;
          ampm='pm';
        }
        if(nList.genre) {
          if(nList.genre.match(/Chill\s?Wave/i))
            genre = 992;
          else if(nList.genre.match(/Jazz/i))
            genre = 990;
          else if(nList.genre.match(/Psychedelic/i))
            genre = 552;
          else if(nList.genre.match(/Punk/i))
            genre = 993;
          else if(nList.genre.match(/Trap/i))
            genre = 991;
          else if(nList.genre.match(/Trip\sHop/i))
            genre = 988;
          else if(nList.genre.match(/World/i))
            genre = 989;
          else if(nList.genre.match(/blue\s?grass/i))
            genre = 557;
          else if(nList.genre.match(/disco/i))
            genre = 551;
          else if(nList.genre.match(/dub\sstep/i))
            genre = 545;
          else if(nList.genre.match(/electro[-\s]?house/i))
            genre = 555;
          else if(nList.genre.match(/folk/i))
            genre = 546;
          else if(nList.genre.match(/funk/i))
            genre = 559;
          else if(nList.genre.match(/hip[-\s]?hop/i))
            genre = 549;
          else if(nList.genre.match(/house/i))
            genre = 553;
          else if(nList.genre.match(/metal/i))
            genre = 561;
          else if(nList.genre.match(/nu[-\s]?disco/i))
            genre = 554;
          else if(nList.genre.match(/pop/i))
            genre = 550;
          else if(nList.genre.match(/r&b/i))
            genre = 560;
          else if(nList.genre.match(/rock/i))
            genre = 547;
          else if(nList.genre.match(/soul/i))
            genre = 558;
          else if(nList.genre.match(/trance/i))
            genre = 556;
        }

        if(nList.artist)
          artist = nList.artist;
        if(nList.song)
          song = nList.song;
        if(nList.album)
          album = nList.album;
        if(nList.label)
          label = nList.label;
        if(nList.ra_url){
          ra_url = 'www.radioactivity.fm' + nList.ra_url
          var query_data = url.parse(ra_url, true).query;
          if (query_data.oid) {
              id = query_data.oid
          }
          else {
            id = -1;
          }
        }

        // Give code 3 seconds before passing variables to set_data
        setTimeout(function() {

          params = [genre, ampm, artist, song, album, label, hours, minutes, month, day, year, ra_id];
          console.log('Done converting parameters')
              console.log('genre: %s', genre);
              console.log('ampm: %s', ampm);
              console.log('artist: %s', artist);
              console.log('song: %s', song);
              console.log('album: %s', album);
              console.log('label: %s', label);
              console.log('hours: %s', hours);
              console.log('minutes: %s', minutes);
              console.log('month: %s', month);
              console.log('day: %s', day);
              console.log('year: %s', year);
              console.log('ra_id: %s', ra_id);

              console.log('that.playlist: ', that.playlist_id)

          return set_data(that, cookie, params, callback)

        }, 3000);
      }
    });
  }//<------------ END Convert Parameters --------------||

  Proxy.prototype.set_edit_data = function(that, cookie, params, callback){

    var genre = params[0];
    var ampm = params[1];
    var artist = params[2];
    var song = params[3];
    var album = params[4];
    var label = params[5];
    var hours = params[6];
    var minutes = params[7];
    var month = params[8];
    var day = params[9];
    var year = params[10];
    var ra_id = params[11];

    var edit_data = querystring.stringify({
      isrequest: 'n',
      playtype: 387,
      genre: genre,
      hour: hours,
      min: minutes,
      ampm: ampm,
      month: month,
      day: day,
      year: year,
      programtype: 'V',
      iswebcast: 'y',
      artist: artist,
      songtitle: song,
      albumtitle: album,
      label: 'label',
      showoid: '',
      submitted: 1,
      sorter: 'reverse',
      oid: ra_id,
      submit: 'make these changes to this entry'
    });

    return that.set_edit_options(data, cookie, callback);
  }

  Proxy.prototype.set_upload_data = function(that, cookie, params, callback) {

    console.log('Setting upload data for playlist', that.playlist_id);

    var genre = params[0];
    var ampm = params[1];
    var artist = params[2];
    var song = params[3];
    var album = params[4];
    var label = params[5];
    var hours = params[6];
    var minutes = params[7];
    var month = params[8];
    var day = params[9];
    var year = params[10];

    var data = querystring.stringify({
      lastxtracksplayed: '5',
      setshowx: '',
      submitted: '1',
      doTimeComplete: 'on',
      show_type: 'V',
      is_streamed: 'y',
      rows_to_show: '5',
      type_1: 'on',
      genre_1: genre,
      hour_1: hours,
      ampm_1: ampm,
      artist1: artist,
      songtitle1: song,
      albumtitle1: album,
      labelname1: label,
      type_2: '',
      genre_2: '',
      hour_2: '',
      ampm_2: '',
      artist2: '',
      songtitle2: '',
      albumtitle2: '',
      labelname2: '',
      type_3: '',
      genre_3: '',
      hour_3: '',
      ampm_3: '',
      artist3: '',
      songtitle3: '',
      albumtitle3: '',
      labelname3: '',
      type_4: '',
      genre_4: '',
      hour_4: '',
      ampm_4: '',
      artist4: '',
      songtitle4: '',
      albumtitle4: '',
      labelname4: '',
      type_5: '',
      genre_5: '',
      hour_5: '',
      ampm_5: '',
      artist5: '',
      songtitle5: '',
      albumtitle5: '',
      labelname5: '',
      numrows: '6'

    });

    that.set_upload_options(data, cookie, callback, params);

  }

  Proxy.prototype.set_edit_options = function(data, cookie, callback) {

    var options = {
      host: 'www.radioactivity.fm',
      port: 80,
      path: '/users/yourshows/editplay.html?',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(data),
        'Cookie' : cookie
      }
    }

    this.send_request(options, data, callback);
  }

  Proxy.prototype.set_upload_options = function(data, cookie, callback, params) {

    var options = {
      host: 'www.radioactivity.fm',
      port: 80,
      path: '/users/log/index.html?',
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Content-Length': Buffer.byteLength(data),
        'Cookie' : cookie
      }
    }

    console.log('Set upload options for playlist ', this.playlist_id);

    this.send_upload_request(options, data, callback, cookie, params);
  }

  Proxy.prototype.send_upload_request = function(options, data, callback, cookie, params) {
    this.send_request(options, data, callback);
    this.find_song(cookie, params);
  }

  Proxy.prototype.send_request = function(options, data, callback) {
    console.log('Sending request to radioactivity');
    var req = http.request(options, callback);
    req.write(data);
    req.end();

  }

  Proxy.prototype.upload_callback = function(response) {
    if(response.statusCode == 200) {
      console.log('Uploaded to Radioactivity')
    }
  }

  Proxy.prototype.edit_callback = function(response) {
    if(response.statusCode == 200) {
        console.log('Updated Radioactivity')
    }
  }

  Proxy.prototype.find_song = function(cookie, params) {

    var find_song_options;
    var cheerio = require('cheerio');
    var genre = params[0];
    var ampm = params[1];
    var artist = params[2];
    var song = params[3];
    var album = params[4];
    var label = params[5];
    var hours = params[6];
    var minutes = params[7];
    var month = params[8];
    var day = params[9];
    var year = params[10];


    find_song_callback = function(response) {
      if(response.statusCode == 200) {
        response.setEncoding('utf8');
        response.on('data', function (chunk) {
          var $ = cheerio.load(chunk);

          $('A').each(function() {
            if($(this).text().match(/(\d+\/\d+\/\d+\s\d+:\d+\s[ap]m)/g)) {
              var date = ($(this).text()).split(/\/|:|\s/);

              if(date[0] == month && date[1] == day && date[2] == year &&
                  date[3] == hours && date[4] == minutes && date[5] == ampm) {
                this.playlist._doc.ra_url = $(this).attr('href');
                this.playlist._doc.update({ra_url: playlist.ra_url}, function (err) {
                  if (err) return handleError(err);
                  console.log('Track %s Updated ra_url to %s', this.playlist.ra_url);
                });
              }
            }
          });
        });
      }
    }

    find_song_options = {
      host: 'www.radioactivity.fm',
      port: 80,
      path: '/users/yourshows/index.html?expand=all&sorter=reverse',
      method: 'GET',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie' : cookie
      }
    }
    req = http.request(find_song_options, find_song_callback);
    req.end();

  }//<--------- END find song -----------||

  module.exports = Proxy
