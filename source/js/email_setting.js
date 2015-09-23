// Add simple validation and notice

(function(window, document) {

  function post(keyToPost, valueToPost) {
    var url = "http://s.init.im:8081/remember/initiumlabSubscription/";
    var request = new XMLHttpRequest();
    var message = {
      username: 'initiumlab',
      key: keyToPost,
      value: valueToPost,
      raw: '',
      datetime: Date.now()
    };

    request.open('POST', url, true);
    request.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
    var jsonString = JSON.stringify(message);
    request.send(jsonString);
    console.log('Tried to post '+jsonString);
  }

  function isEmailAddressValid(addr) {
    var re = /\S+@\S+\.\S+/;
    return re.test(addr);
  }

  var btnSubscribe = document.getElementById('mc-embedded-subscribe');
  var inputEmail = document.getElementById('mce-EMAIL');
  var divNotice = document.getElementById('subscriptionNotice');

  btnSubscribe.onclick = function(event){
    event.preventDefault();
    var message;

    window.xdomain.slaves({
      "http://s.init.im:8081": "/proxy.html"
    });

    if (isEmailAddressValid(inputEmail.value)) {
      post('subscribe', inputEmail.value);
      message = inputEmail.value + ' has been inlcuded in our subscription list. Thank you.';
    } else {
      message = "'" + inputEmail.value + "'" + " seems invalid. Please try again.";
    }

    divNotice.textContent = message;

  };

}(window, window.document));