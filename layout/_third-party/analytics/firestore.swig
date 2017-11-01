{% if theme.firestore.enable %}
<script src="https://www.gstatic.com/firebasejs/4.6.0/firebase.js"></script>
<script src="https://www.gstatic.com/firebasejs/4.6.0/firebase-firestore.js"></script>
<script>
	(function(){
		var title='{{ page.title }}'
		if(title){

			firebase.initializeApp({
				apiKey: '{{ theme.firestore.apiKey }}',
				projectId: '{{ theme.firestore.projectId }}'
			})


			var db = firebase.firestore()
			var articles=db.collection('{{ theme.firestore.collection }}')
			var doc=articles.doc(title)

			doc.get().then(function(d){
				var count
				if(!d.exists){ //has no data, initialize count
					doc.set({
						count: 1
					})
					count=1
				}
				else{ //has data
					count=d.data().count
					if(!(window.localStorage&&window.localStorage.getItem(title))){ //if first view this article
						doc.set({ //increase count
							count: count+1
						})
            count++
					}
				}
        if(window.localStorage){ //mark as visited
          localStorage.setItem(title,true)
        }

        //append to meta
				$('.post-meta').append(
          $('<span>').addClass('post-visitors-count').append(
            $('<span>').addClass('post-meta-divider').text('|')
          ).append(
            $('<span>').addClass('post-meta-item-icon').append(
              $('<i>').addClass('fa fa-users')
            )
          ).append($('<span>').text('{{ __("post.visitors")}} '+count))
        )
			})
		}
	})()
</script>
{% endif %}
