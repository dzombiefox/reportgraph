<script>
    function removeItem(){
      $("#dialogRemove").dialog("open");   
    }
   
    function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    function saveItem(){
           var acode= "ITEM CODE  Can't empty";
           var aname= "ITEM NAME  Can't empty";
           var adesc= "Description  Can't empty";
           var acol= "Color  Can't empty";
           var aup= "Uprecent  Can't empty";
           var ah2o= "H20  Can't empty";
            var id=$("#id").val();
            var kode=$("#kode").val();
            var nama=$("#nama").val();
            var desc=$("#desc").val();
            var color=$("#color").val();
            var recent=$("#recent").val();
            var h2o=$("#h2o").val();   
            if(kode==""){
                 $.Notify({                
                content: acode,
                type: 'alert'                
            });    
            $("#kode").focus();
              }
              else if(nama==""){
                $.Notify({                
                content: aname,
                type: 'alert'                
            });     
                  $("#nama").focus();
              }
               else if(desc==""){
                $.Notify({                
                content: adesc,
                type: 'alert'                
            });     
                  $("#desc").focus();
              }
              else if(color==""){
                $.Notify({                
                content: acol,
                type: 'alert'                
            });     
                  $("#color").focus();
              }
              else if(recent==""){
                $.Notify({                
                content: aup,
                type: 'alert'                
            });     
                  $("#recent").focus();
              }
              else if(h2o==""){
                $.Notify({                
                content: ah2o,
                type: 'alert'                
            });     
                  $("#h2o").focus();
              }
              else{
            $.ajax({
                url:"item/save.jsp",
                data:"kode="+kode+"&nama="+nama+"&desc="+desc+"&color="+color+"&recent="+recent+"&id="+id+"&h2o="+h2o,
                success:function(){
                 clear();
                    RefreshTable("#example","item/json.jsp");
                
                }
                
            });
              }
    }
    function disabledButton(){
        $("#edit").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        
    }
     function enabledButton(){
        $("#edit").removeAttr("disabled");
        $("#remove").removeAttr("disabled");
        
    }
    function clear(){
         $("#kode").val("");
         $("#nama").val("");
         $("#desc").val("");
         $("#color").val("");
         $("#recent").val("");
         $("#h2o").val("");
        
    }
    
    $("#document").ready(function(){
      disabledButton();
     
      $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
            clear();
        $("#dialogAdd").dialog("open");
        disabledButton();
    });
    $("#clear").click(function(){
        clear();
    });
        $("#remove").attr("disabled","disabled");
        var idItem="";
        var kode="";
        var nama="";
        var desc="";
        var color="";
        var recent="";
        var h2o="";
        $(".tutup").click(function(){
                  clear();
        });
          $("#update").click(function(){
           var acode= "ITEM CODE  Can't empty";
           var aname= "ITEM NAME  Can't empty";
           var adesc= "Description  Can't empty";
           var acol= "Color  Can't empty";
           var aup= "Uprecent  Can't empty";
           var ah2o= "H20  Can't empty";  
            var kode=$("#kode").val();
            var nama=$("#nama").val();
            var desc=$("#desc").val();
            var color=$("#color").val();
            var recent=$("#recent").val();
            var h2o=$("#h2o").val();
            if(kode==""){
                 $.Notify({                
                content: acode,
                type: 'alert'                
            });    
            $("#kode").focus();
              }
              else if(nama==""){
                $.Notify({                
                content: aname,
                type: 'alert'                
            });     
                  $("#nama").focus();
              }
               else if(desc==""){
                $.Notify({                
                content: adesc,
                type: 'alert'                
            });     
                  $("#desc").focus();
              }
              else if(color==""){
                $.Notify({                
                content: acol,
                type: 'alert'                
            });     
                  $("#color").focus();
              }
              else if(recent==""){
                $.Notify({                
                content: aup,
                type: 'alert'                
            });     
                  $("#recent").focus();
              }
              else if(h2o==""){
                $.Notify({                
                content: ah2o,
                type: 'alert'                
            });     
                  $("#h2o").focus();
              }            
            else{
            $.ajax({
                url:"item/update.jsp",
                data:"id="+idItem+"&kode="+kode+"&nama="+nama+"&desc="+desc+"&color="+color+"&recent="+recent+"&volume="+h2o,
                success:function(){                    
                    clear();
                    RefreshTable("#example","item/json.jsp");
                    $("#dialogAdd").dialog("close");
                    //$("#save").show();
                    //$("#update").hide();
              
                }
                
            });
        }
            
            
        });
        $("#edit").click(function(){              
              $("#save").hide();
              $("#edit").show();
	      $("#dialogAdd").dialog("open");
              $("#kode").val(kode);
              $("#nama").val(nama);
              $("#desc").val(desc);
              $("#color").val(color);
              $("#recent").val(parseFloat(recent));
              $("#h2o").val(h2o);
              $("#update").show();
              return false;
            
        });
        $("#doneRemove").click(function(){        
          $.ajax({
               data:"id="+idItem,
               url:"item/delete.jsp",
               success:function(){
               RefreshTable("#example","item/json.jsp");
               closeDialog();
               disabledButton();
               }
                
            });
      
 
});
            
        
  
       
        var table=$("#example").dataTable({
             "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
        "sPaginationType": "full_numbers",
        ajax: "item/json.jsp"
        });
        
        $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        idItem= $("#example").dataTable().fnGetData( this, 1 );
                        kode=$('td', this).eq(1).text();
                        nama=$('td', this).eq(2).text();
                        desc=$('td', this).eq(3).text();
                        color=$('td', this).eq(6).text();
                        recent=$('td', this).eq(4).text();
                        h2o=$('td', this).eq(5).text();
                        enabledButton();
                        $("#update").removeAttr("disabled");
		}
	} ); 
        $("#update").attr("disabled","disabled");
       
        
        
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Items</a></li>
    <li><a href="#">Data Items</a></li>
</ul>
 <hr class="thin bg-grayLighter">
  <div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="doneRemove" >OK</button>&nbsp; <button class="button default" id="cancel" onclick="closeDialog()">Cancel</button>
     </div>
 <div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
 <br>
    <input type="hidden" value="<%=session.getAttribute("id")%>"  id="id">
 <table width="700px" class="tableInput">
                        <tr >
                            <td> <label>ITEM CODE</label></td>
                            <td> <div class="input-control text full-size"><input type="text" name="kode" id="kode" ></div></td>
                            
                        </tr>
                        <tr>
                            <td> <label>ITEM NAME</label></td>
                            <td><div class="input-control text full-size"><input type="text" name="nama" id="nama"></div></td>
                            
                        </tr>
                        <tr>
                            <td><label>DESCRIPTION</label></td>
                            <td><div class="input-control text full-size"><input type="text" name="desc" id="desc" ></div></td>
                            
                        </tr>
                        <tr >
                            <td> <label>COLOR</label></td>
                            <td> <div class="input-control text full-size"><input type="text" name="color" id="color" ></div></td>
                            
                        </tr>
                        <tr>
                            <td> <label>UPRECENT</label></td>
                            <td><div class="input-control text full-size"><input type="text" name="recent" id="recent"></div></td>
                            
                        </tr>
                        <tr>
                            <td><label>H20</label></td>
                            <td><div class="input-control text full-size"><input type="text" name="h2o" id="h2o" ></div></td>
                            
                        </tr>
                        <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveItem()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
 <input type="submit" id="add" class="button success" value="Add Item"/>&nbsp; <button class="button warning" id="edit" >Edit Item</button>&nbsp; <button class="button alert" id="remove" onclick="removeItem()">Remove</button>
                <table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>ID</th>
						<th>Item Code</th>
						<th>Item Name</th>
						<th>Description</th>
						<th>Uprecent</th>
                                                <th>Volume</th>
                                                <th>Color</th>
            </tr>
        </thead>
 
     
 
        <tbody>
           
          
        </tbody>
    </table>
         