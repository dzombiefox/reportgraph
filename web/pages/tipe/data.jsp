<script type="text/javascript">
    function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    function removeType(){
        $("#dialogRemove").dialog("open");  
    }
 function saveType(){                   
  var aval= "Name  Can't empty";  
  var name=$("#name").val();
  var type=$("#type").val();
  if(name=="") {
    $.Notify({                
                content: aval,
                type: 'alert'                
            });    
            $("#name").focus();
      
  }else{
  $.ajax({
       type:"POST", 
       url:"tipe/save.jsp",
       data:"&name="+name+"&type="+type,
       success:function(){
       RefreshTable("#example","tipe/json.jsp");  
       $("#name").val("");
      }
  });
  
    } 
        
    }
    function clear(){
        $("#name").val("");
    }
     function disabledButton(){
        $("#edit").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        
    }
     function enabledButton(){
        $("#edit").removeAttr("disabled");
        $("#remove").removeAttr("disabled");
        
    }
    $(document).ready(function(){
        var idItem="";
        var nama="";
        var tipe="";
          $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
            clear();
        $("#dialogAdd").dialog("open");
        disabledButton();
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
        ajax: "tipe/json.jsp"
        });
          $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        idItem= $("#example").dataTable().fnGetData( this, 1 );
                        nama=$('td', this).eq(1).text();
                        tipe=$('td', this).eq(2).text();                       
                        enabledButton();                
                       }
	} );
        $("#doneRemove").click(function(){
               $.ajax({
               data:"id="+idItem,
               url:"tipe/delete.jsp",
               success:function(){
               RefreshTable("#example","tipe/json.jsp");
               disabledButton();
               closeDialog();
               }
                
            });
        });
           $("#edit").click(function(){
              $("#save").hide();
              $("#update").show();
              $("#dialogAdd").dialog("open");             
	      $("select#type option").each(function() { this.selected = (this.text == tipe); });
               $("#name").val(nama);
                return false;
            
        });
  $("#update").click(function(){ 
        var name=$("#name").val();
        var tipe=$("#type").val();      
            $.ajax({
                url:"tipe/update.jsp",
                data:"&id="+idItem+"&nm="+name+"&ty="+tipe,
                success:function(){
                    clear();
                    $("#dialogAdd").dialog("close");
                    RefreshTable("#example","tipe/json.jsp");
                    disabledButton();
                   
                }
                
            });
            
    });
    });
    
</script> 
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Type</a></li>
    <li><a href="#">Data Type</a></li>
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
                            <td> <label>NAME</label></td>
                            <td> <div class="input-control select full-size"><input type="text"  id="name" ></div></td>
                            
                        </tr>
                        <tr>
                            <td> <label>DENSITY</label></td>
                            <td><div class="input-control text full-size"><select id="type"  style="width: 100%">
                                    
                                    <option>DARK</option>
                                    <option>MEDIUM</option>
                                    <option>LIGHT</option>
                                </select></div></td>
                            
                        </tr>
                       
                        
                       
                        <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveType()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
 <input type="submit" id="add" class="button success" value="Add Type"/>&nbsp; <button class="button warning" id="edit" >Edit Type</button>&nbsp; <button class="button alert" id="remove" onclick="removeType()">Remove</button>
<table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>ID</th>
						<th>Type Name</th>
						<th>Density</th>
						
                                            
            </tr>
        </thead>
 
     
 
        <tbody>
           
          
        </tbody>
    </table>