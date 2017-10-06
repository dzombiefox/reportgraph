<script>
    function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    function removeFormula(){
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
           $("#value").val("");
    }
function saveFormula(){ 
  var aval= "VALUE  Can't empty";    
  var name=$("#name").val();
  var size=$("#size").val();
  var val=$("#value").val();
  var sta=$("#status").val();
  if(val=="") {
   $.Notify({                
                content: aval,
                type: 'alert'                
            });    
            $("#value").focus();
      
  }else{
  $.ajax({
       type:"POST", 
       url:"formula/save.jsp",
       data:"&name="+name+"&size="+size+"&val="+val+"&sta="+sta,
       success:function(){      
       RefreshTable("#example","formula/json.jsp");  
       clear();
      }
  });
  
    }
    }
    $("#document").ready(function(){
        $("#clear").click(function(){
            clear();
        });
        disabledButton();
            $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
            clear();
        $("#dialogAdd").dialog("open");
        disabledButton();
    });
               var items,size;
               
              
  $.getJSON("jsonData/jsonName.jsp",function(data){
    $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#name").html(items); 
       
  });
    $("#name").select2();
    $("#size").select2();
    $("#status").select2();
   $.getJSON("jsonData/jsonSize.jsp",function(data){
    $.each(data,function(index,item) 
    {
      size+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#size").html(size); 
       
  });
        $("#remove").attr("disabled","disabled");
        var idItem="";
        var nama="";
        var size="";
        var status="";
        var value="";     
       
        $("#update").click(function(){           
        var name=$("#name").val();
        var size=$("#size").val();
        var value=$("#value").val();
        var status=$("#status").val();
            $.ajax({
                url:"formula/update.jsp",
                    data:"&id="+idItem+"&name="+name+"&size="+size+"&value="+value+"&status="+status,
                    success:function(){
                    clear();
                    $("#dialogAdd").dialog("close");
                    RefreshTable("#example","formula/json.jsp");
                    disabledButton();
                }
                
            });
            
            
        });
        
        
     
        $("#doneRemove").click(function(){
          $.ajax({
               data:"id="+idItem,
               url:"formula/delete.jsp",
               success:function(){              
               RefreshTable("#example","formula/json.jsp");
               disabledButton();
               closeDialog();
           }
               });
    });
    $("#edit").click(function(){
              $.ajax({
                  data:"id="+idItem,
                  url:"formula/edit.jsp",
                  success:function(data){
                          $("#dialogAdd").dialog("open");
                          $("#save").hide();
                          $("#update").show();
                          var w=JSON.parse(data);
                          $("#name").select2("data", {id:w.data_id  ,text: w.name });
                          $("#size").select2("data", { id:w.size_id ,text: w.size });
                          $("#status").select2("data", { id:w.status ,text: w.status });
                          $("#value").val(w.value);
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
        ajax: "formula/json.jsp"
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
       
        
    });
</script>

<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Formula</a></li>
    <li><a href="#">Data Formula</a></li>
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
                            <td> <label>Formula Name</label></td>
                            <td> <select id="name"  style="width: 100%"><option>Select Name</option></select></td>
                            
                        </tr>
                        <tr>
                            <td> <label>SIZE</label></td>
                            <td><select id="size"  style="width: 100%"><option>Select size</option></select></td>
                            
                        </tr>
                        <tr>
                            <td><label>STATUS</label></td>
                            <td> <select id="status"  style="width: 100%">
                                    <option>kering</option>
                                    <option>basah</option>
                                </select></td>
                            
                        </tr>
                        <tr >
                            <td> <label>VALUE</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="value" style="width: 100%" class="input" ></div></td>
                            
                        </tr>
                       
                       
                        <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveFormula()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
       <input type="submit" id="add" class="button success" value="Add Formula"/>&nbsp; <button class="button warning" id="edit" >Edit Formula</button>&nbsp; <button class="button alert" id="remove" onclick="removeFormula()">Remove</button>
                <table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>ID</th>
						<th>Formula Name</th>
						<th>Size</th>
						<th>Value</th>
						<th>Status Bahan</th>
                                            
            </tr>
        </thead>
 
     
 
        <tbody>
           
          
        </tbody>
    </table>
           
     