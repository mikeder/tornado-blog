function radioTitle() {

// this is the URL of the json.xml file located on your server.
    var url = 'http://sqweeb.net:8000/json.xsl';

$.ajax({
   type: 'GET',
    url: url,
    async: true,
    jsonpCallback: 'parseMusic',
    contentType: "application/json",
    dataType: 'jsonp',
    success: function(json) {
        // this is the element we're updating that will hold the track title
       $('#track-title').text(json['/radio']['title']);
        // this is the element we're updating that will hold the listeners count
       $('#listeners').text(json['/radio']['listeners']);
       $('#description').text(json['/radio']['description'])
       $('#server-name').text(json['/radio']['server_name'])
       $('#bitrate').text(json['/radio']['bitrate'])
       $('#genre').text(json['/radio']['genre'])
    },
    error: function(e) {
       console.log(e.message);
    }
});

}

$(document).ready(function(){

  setTimeout(function(){radioTitle();}, 2000);
  setInterval(function(){radioTitle();}, 15000); // we're going to update our html elements / player every 15 seconds

});