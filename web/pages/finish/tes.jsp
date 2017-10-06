<script>
$(document).ready(function(e) {
    $("form#data").submit(function(){
        $.ajax({
        url: "finish/ok.jsp",       
        data: $("#data").serialize(),
        async: false,
        success: function (data) {
            alert(data)
        },
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
});
});
</script>


<form id="data" method="post" enctype="multipart/form-data">
<input type="text" name="nama" required />   

    <button>Submit</button>
</form>