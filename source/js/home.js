(function(window, document, xdomain){

  console.log('home script loaded');

  function addQuote() {
    var quotes = [
      "All models are wrong, but some are useful.",
      "Anyone can popularize science if he oversimplify.",
      "98% of all statistics are made up.",
      "An approximate answer to the right problem is worth a good deal more than an exact answer to an approximate problem.",
      "Prediction is very difficult, especially about the future.",
      "If you torture the data enough, nature will always confess.",
      "It's easy to lie with statistics; it is easier to lie without them.",
      "The future is already here: it's just not very evenly distributed.",
      "The fewer the facts, the stronger the opinion.",
      //"A data journalist talks data to the journalist and journalism to engineers; but then he meets another data journalist, they just discuss women.",
      "Science is piecemeal revelation.",
      "Astronomy compels the soul to look upwards and leads us from this world to another.",
      "There's real poetry in the real world. Science is the poetry of reality.",
      "The 50-50-90 rule: Anytime you have a 50-50 chance of getting something right, there's a 90% probability you'll get it wrong.",
      "It is a capital mistake to theorize before one has data. Insensibly one begins to twist facts to suit theories, instead of theories to suit facts.",
      "The plural of anecdote is not data.",
      "Absence of evidence is not evidence of absence.",
      "The plural of anecdote is not data.",
      "Math is a language that you use to describe statistics, but really it's about collecting information and putting it in an order that makes sense.",
      "It always takes longer than you expect, even when you take into account Hofstadter's Law. — Hofstadter's Law",
      "The first 90% of the code accounts for the first 90% of the development time. The remaining 10% of the code accounts for the other 90% of the development time.",
      "If debugging is the process of removing software bugs, then programming must be the process of putting them in."
    ];
    /* These quotes are not attributed because we can't verify the authenticity of many of the attributions. */

    var quoteDOMNode = document.getElementById('quote');
    var currentQuote = window.localStorage['currentQuote'];

    var randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
    while (randomQuote === currentQuote) {
      randomQuote = quotes[Math.floor(Math.random() * quotes.length)];
    }
    var textNode = document.createTextNode(randomQuote);
    quoteDOMNode.appendChild(textNode);
    window.localStorage['currentQuote'] = randomQuote;
  }

  addQuote();

  /* Add lightbox effects */

  window.currentLightbox = null;
  var projects = [];

  function closeLightbox(lightbox) {
    lightbox.style.display = 'none';
    document.body.classList.remove('no-scroll');
    window.currentLightbox = null;

    // Clear hash
    window.location.hash = '';
    window.history.pushState("", document.title, window.location.pathname + window.location.search);
    console.log(lightbox)

    ga('send', 'lightbox', 'close', lightbox.id);
  }

  function configLightbox(project){
    var anchor = document.getElementById('anchor-'+project);
    var btnClose = document.getElementById('btnClose-'+project);
    var lightbox = document.getElementById('lightbox-'+project);

    anchor.addEventListener('click', function(event){

      // Open Lightbox

      event.preventDefault();
      lightbox.style.display = 'block';
      document.body.classList.add('no-scroll');
      window.location.hash = event.target.parentNode.id.replace('anchor-', '');
      window.currentLightbox = lightbox;

      ga('send', 'lightbox', 'open', lightbox.id);

    });

    btnClose.addEventListener('click', function(){
      closeLightbox(lightbox);
    });

    projects.push([project, lightbox]);
  }

  document.onkeydown = function(event){
    if (event.keyCode === 27) {
      // Esc key
      closeLightbox(window.currentLightbox);
    }
  };

  configLightbox('legco');
  configLightbox('wasted');
  configLightbox('media-tech');
  configLightbox('database');
  configLightbox('salary360');
  configLightbox('designCollection');

  // Open lightbox if location includes hashtags pointing to a case
  var hash = window.location.hash;
  var i, projectName, lightbox;
  if (hash != '') {
    for (i = 0; i < projects.length; i += 1) {
      projectName = projects[i][0];
      lightbox = projects[i][1];
      if (hash.slice(1) === projectName) {
        lightbox.style.display = 'block';
        document.body.classList.add('no-scroll');
        window.currentLightbox = lightbox;

        ga('send', 'lightbox', 'url-direct-open', lightbox.id);
      }
    }
  }


}(window, window.document, window.xdomain));