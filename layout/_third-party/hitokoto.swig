<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sql.js/0.4.0/js/sql.js"></script>
      </script>
      <script>
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/HITODB.db', true);
    xhr.responseType = 'arraybuffer';

    xhr.onload = function(e) {
        var uInt8Array = new Uint8Array(this.response);
        var db = new SQL.Database(uInt8Array);
        var contents = db.exec("select * from hitokoto order by random() limit 1");
        var hitokoto = contents[0].values[0][1]
        var source = contents[0].values[0][2]
        document.getElementById("cost-inner").textContent = hitokoto+'——「'+source+'」';
    };
    xhr.send();
</script>
