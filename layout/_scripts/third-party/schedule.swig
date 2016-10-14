{% if theme.calendar.enable %}
{% if page.type == 'schedule' %}

<script>

// Initialization
var _n = function(arg) { if(arg) return arg; else return void 0;}

var cal_data = void 0;

var now = new Date();
var timeMax = new Date();
var timeMin = new Date();

// Read config form theme config file
var calId           = _n('{{ theme.calendar.calendar_id  }}')                ;
var apiKey          = _n('{{ theme.calendar.api_key      }}')                ;
var orderBy         = _n('{{ theme.calendar.ordarBy      }}')  || 'startTime';
var offsetMax       = _n( {{ theme.calendar.offsetMax    }} )  || 24         ;
var offsetMin       = _n( {{ theme.calendar.offsetMin    }} )  || 4          ;
var timeZone        = _n( {{ theme.calendar.timeZone     }} )  || void 0     ;
var showDeleted     = _n( {{ theme.calendar.showDeleted  }} )  || 'false'    ;
var singleEvents    = _n( {{ theme.calendar.singleEvents }} )  || 'true'     ;
var maxResults      = _n( {{ theme.calendar.maxResults   }} )  || '250'      ;

timeMax.setHours(now.getHours() + offsetMax);
timeMin.setHours(now.getHours() - offsetMin);

// Build URL
BASE_URL            = 'https://www.googleapis.com/calendar/v3/calendars/';
FIELD_KEY           = 'key';
FIELD_ORDERBY       = 'orderBy';
FIELD_TIMEMAX       = 'timeMax';
FIELD_TIMEMIN       = 'timeMin';
FIELD_TIMEZONE      = 'timeZone';
FIELD_SHOWDELETED   = 'showDeleted';
FIELD_SINGLEEVENTS  = 'singleEvents';
FIELD_MAXRESULTS    = 'maxResults';

key                 = 'AIzaSyCjcukcNCAjWnIlI8MNatepeUX0038HRTU';
timeMaxISO          = timeMax.toISOString();
timeMinISO          = timeMin.toISOString();

request_url = BASE_URL + calId + '/events?'  +
  FIELD_KEY           + '=' + apiKey        + '&' +
  FIELD_ORDERBY       + '=' + orderBy       + '&' +
  FIELD_TIMEMAX       + '=' + timeMaxISO    + '&' +
  FIELD_TIMEMIN       + '=' + timeMinISO    + '&' +
  FIELD_SHOWDELETED   + '=' + showDeleted   + '&' +
  FIELD_SINGLEEVENTS  + '=' + singleEvents  + '&' +
  FIELD_MAXRESULTS    + '=' + maxResults;

if (timeZone) {
  request_url = request_url + '&' + FIELD_TIMEZONE + '=' + timeZone;
}

var prevStart; // use this variable to decide where to insert an <hr>

// Send query
$.ajax({
  dataType: 'json',
  url: request_url,
  success: function(data) {
    cal_data = data;
    data['items'].forEach((item) => {

      // parse data
      var start         = new Date(item.start.dateTime);
      var end           = new Date(item.end.dateTime);
      var nowFlag       = false;
      var classNow      = "";
      var relativeTime  = "";

      relativeTime = calcTime(now, start);

      if (start < now && now < end) {
        classNow = "event-now";
        nowFlag = true;
        relativeTime = "NOW";
      }
      else {
        if (prevStart < now && start > now) {
          $('#schedule #event-list').append('<hr>');
        }
      }

      $('#schedule #event-list').append('<li class="event ' + classNow + '">' +
      '<h2 class="event-summary">' +

      // summary
      item['summary']

      + '<span class="event-start">' +

      // relative time or NOW if the event is on going
      relativeTime

      + '</span>' +
      '</h2>' +
      {% if theme.calendar.showLocation %}
      (( item['location'] &&
        ('<span class="event-location">' +

        // location
        item['location']

        + '</span>')
      ) || "") +
      {% endif %}
      '</li>');

      prevStart = start;
    });
  }
});

function calcTime(current, previous) {

    var msPerMinute = 60 * 1000;
    var msPerHour = msPerMinute * 60;
    var msPerDay = msPerHour * 24;
    var msPerMonth = msPerDay * 30;
    var msPerYear = msPerDay * 365;

    var elapsed = current - previous;

    var tense = elapsed > 0 ? "ago" : "later";

    elapsed = Math.abs(elapsed);

    if (elapsed < msPerMinute) {
         return Math.round(elapsed/1000) + ' seconds ' + tense;
    }

    else if (elapsed < msPerHour) {
         return Math.round(elapsed/msPerMinute) + ' minutes ' + tense;
    }

    else if (elapsed < msPerDay ) {
         return Math.round(elapsed/msPerHour ) + ' hours ' + tense;
    }

    else if (elapsed < msPerMonth) {
        return 'approximately ' + Math.round(elapsed/msPerDay) + ' days ' + tense;
    }

    else if (elapsed < msPerYear) {
        return 'approximately ' + Math.round(elapsed/msPerMonth) + ' months ' + tense;
    }

    else {
        return 'approximately ' + Math.round(elapsed/msPerYear ) + ' years' +
        tense;
    }
}

</script>

{% endif %}
{% endif %}
