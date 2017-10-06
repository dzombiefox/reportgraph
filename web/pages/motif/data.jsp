<script>
     function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    function removeMotif(){
       $("#dialogRemove").dialog("open");
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
         $("#name").val("");
		 $("#code").val("");
    }
    function saveMotif(){       
  var aval= "Motif Name  Can't empty"; 
  var code=$("#code").val();
  var name=$("#name").val();
  var type=$("#type").val();
  var brand=$("#brand").val();
  var option=$("#option").val();
  if(name=="") {
     $.Notify({                
                content: aval,
                type: 'alert'                
            });    
            $("#name").focus(); 
      
  }else{
  $.ajax({
       type:"POST", 
       url:"motif/save.jsp",
       data:"&name="+name+"&type="+type+"&brand="+brand+"&option="+option+"&code="+code,
       success:function(){
       RefreshTable("#example","motif/json.jsp");  
       clear();
        
      }
  });
  
    }
    }
    $(document).ready(function(){
        $("#type").select2();
        $("#brand").select2();
        $("#option").select2();
        disabledButton();
        var items="";
        var items2="";
        var idItem="";
        var nama="";
		var code="";
        var tipe="";
        var brand="";
        var option="";
  $.getJSON("jsonData/jsonTipe.jsp",function(data){
    $.each(data,function(index,item) 
    {
       items+="<option value='"+item.id+"'>"+item.name+" "+item.density+"</option>";
    });
    $("#type").html(items); 
       
  });
  
    $.getJSON("jsonData/jsonBrand.jsp",function(data){
    $.each(data,function(index,item) 
    {
      items2+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#brand").html(items2); 
       
  });
        $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
            clear();
        $("#dialogAdd").dialog("open");
         disabledButton();
    })
          var table=$("#example").dataTable({
             "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
        "sPaginationType": "full_numbers",
        ajax: "motif/json.jsp"
        });
        
        $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        idItem= $("#example").dataTable().fnGetData( this, 1 );
                        enabledButton();
                    
                        
                        
		}
	} );
        $("#edit").click(function(){
            $.ajax({
                data:"id="+idItem,
                url:"motif/edit.jsp",
                success:function(data){
                        $("#save").hide();
                        $("#update").show();  
                        $("#dialogAdd").dialog("open");
                        var w=JSON.parse(data);
                        $("#name").val(w.name);
						$("#code").val(w.code);
                        $("#type").select2("data", {id:w.type_id  ,text: w.type+" "+w.density });
                        $("#brand").select2("data", {id:w.brand_id  ,text: w.brand });
                        $("#opt").select2("data", {id:w.opt  ,text: w.opt });
                        
                }
                
            });
            /*
              $("#save").hide();
              $("#update").show();  
              $("#dialogAdd").dialog("open"); 
	      $("select#type option").each(function() { this.selected = (this.text == tipe); });
              $("select#brand option").each(function() { this.selected = (this.text == brand); });
              $("select#option option").each(function() { this.selected = (this.text == option); });
              $("#name").val(nama);
                return false;
                */
        });
        $("#update").click(function(){ 
		var code=$("#code").val();		
        var name=$("#name").val();
        var tipe=$("#type").val();
        var brand=$("#brand").val();
        var option=$("#option").val();
            $.ajax({
                url:"motif/update.jsp",
                data:"&id="+idItem+"&nm="+name+"&ty="+tipe+"&brand="+brand+"&option="+option+"&code="+code,
                success:function(){
                    $("#dialogAdd").dialog("close");
                    clear();
                    RefreshTable("#example","motif/json.jsp");
                    disabledButton();
                }
                
            });
            
            
        });
        $("#doneRemove").click(function(){
              $.ajax({
               data:"id="+idItem,
               url:"motif/delete.jsp",
               success:function(){                
                RefreshTable("#example","motif/json.jsp");
                closeDialog();
                disabledButton();
               }
                
            });
        });
        
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Motif</a></li>
    <li><a href="#">Data Motif</a></li>
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
                            <td> <label>MOTIF CODE</label></td>
                            <td> <div class="input-control select full-size"><input type="text"  id="code" ></div></td>
                            
                        </tr>
                        <tr >
                            <td> <label>MOTIF NAME</label></td>
                            <td> <div class="input-control select full-size"><input type="text"  id="name" ></div></td>
                            
                        </tr>
                        <tr>
                            <td> <label>TYPE</label></td>
                            <td><select id="type" style="width: 100%" ><option>select type</option></select></td>                            
                        </tr>
                        <tr>
                            <td> <label>BRAND</label></td>
                            <td><select id="brand"  style="width: 100%"><option>select brand</option></select></td>                            
                        </tr>
                        <tr>
                            <td> <label>OPTION</label></td>
                            <td><select id="option"  style="width: 100%">
                                    <option>General</option>
                                    <option>Compliement</option>
                                    </select></td>                            
                        </tr>                       
                        <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveMotif()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
 <input type="submit" id="add" class="button success" value="Add Motif"/>&nbsp; <button class="button warning" id="edit" >Edit Motif</button>&nbsp; <button class="button alert" id="remove" onclick="removeMotif()">Remove</button>   &nbsp;<a href="?page=motif/uploadFoto" class="button">IMAGE Galery</a>
<table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
                                                <th>NO</th>
                                                <th>ID</th>
												<th>Motif Code</th
						<th>Motif Name</th>
						<th>Motif Type</th>
						<th>Brand </th>
                                                <th>Option</th>
                                            
            </tr>
        </thead>
 
     
 
        <tbody>
           
          
        </tbody>
    </table>