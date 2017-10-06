<script>    
$(document).ready(function(e) {
    $(".example").load("motif/galery.jsp");
     var items;
     $.getJSON("jsonData/jsonMotif.jsp",function(data){
    $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+" "+item.tipe+" "+item.option+"</option>";
    });
    $("#motif").html(items); 
       
  });
    
$("form#data").submit(function(){
    var aval= "Success add Foto"; 
    var formData = new FormData($(this)[0]);
    $.ajax({
        url: "motif/upload.jsp",
        type: 'POST',
        data: formData,
        async: false,
        success: function (data) {
         $.Notify({                
                content: aval,
                type: 'alert'                
            }); 
             $(".example").load("motif/galery.jsp");
        },
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
});
});
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Upload</a></li>
    <li><a href="#">Upload Foto</a></li>
</ul>
<form id="data" action="motif/upload.jsp" method="POST" enctype="multipart/form-data">
                 <table style="width: 100%" cellpadding="6px">                   
         
        <tr>
            <td width="100px">Motif</td>
            <td>:</td>
                        <td><div class="input-control select full-size"><select name="nama" id="motif">
                
                    </select></div></td>
        </tr>
       
        <tr>
            
            <td width="100px">File</td>
            <td>:</td>
            <td><div class="input-control select full-size"><input  name="file"  style="width:100%" type="file"  required id="file"></div></td>
        </tr>
        
        <tr>
            <td></td>
            <td></td>
            <td>
                <input  class=" info"  type="submit" value="Upload" id="save" />
         </tr>
       
    </table>                  
                </form>
<hr class="thin bg-grayLighter">	
<div class="example" data-text="Image Motif">
  

        </div>

        

