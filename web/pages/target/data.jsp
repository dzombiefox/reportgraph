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
    function kosong(){
        $("#kw1").val("");
        $("#kw2").val("");
        $("#kw3").val("");
        $("#kw4").val("");
        $("#kw5").val("");
        
    }
    function savePersen(){
        var aval1= "VALUE  Can't empty"; 
        var aval2= "VALUE  Can't empty"; 
        var aval3= "VALUE  Can't empty"; 
        var aval4= "VALUE  Can't empty"; 
        var aval5= "VALUE  Can't empty"; 
        var asch="Schedule Can't empty";
        var line=$("#line").val();
        var sch=$("#sch").val();
        var type=$("#type").val();
        var size=$("#size").val();
        var kw1=$("#kw1").val();
        var kw2=$("#kw2").val();
        var kw3=$("#kw3").val();
        var kw4=$("#kw4").val();
        var kw5=$("#kw5").val();
        $.ajax({
            url:"target/save.jsp",
            data:"line="+line+"&size="+size+"&type="+type+"&sch="+sch+"&kw1="+kw1+"&kw2="+kw2+"&kw3="+kw3+"&kw4="+kw4+"&kw5="+kw5,
            success:function(){
                kosong();
                RefreshTable("#example","target/json.jsp");  
            }
            
        });
        
    }
$(document).ready(function(){
    $("#line").select2();
    $("#type").select2();
    $("#size").select2();
    $("#sch").number( true );
    $("#kw1").number( true );
    $("#kw2").number( true );
    $("#kw3").number( true );
    $("#kw4").number( true );
    $("#kw5").number( true );
    var id,a,b,c,d,e,f,g,h,i;
    var items,size,type;              
    $.getJSON("jsonData/jsonLine.jsp",function(data){
        $.each(data,function(index,item) 
        {
          items+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $("#line").html(items);        
    });  
    $.getJSON("jsonData/jsonTipe.jsp",function(data){
       
        $.each(data,function(index,item) 
        {
          type+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $("#type").html(type);        
    });
        $.getJSON("jsonData/jsonSize.jsp",function(data){
          //   size+="<option value='0'>-</option>";
        $.each(data,function(index,item) 
        {
          size+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $("#size").html(size);        
    });
    $('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        id= $("#example").dataTable().fnGetData( this, 1 );
                        a=$('td', this).eq(1).text();
                        b=$('td', this).eq(2).text();
                        c=$('td', this).eq(3).text();
                        d=$('td', this).eq(4).text();
                        e=$('td', this).eq(5).text();
                        f=$('td', this).eq(6).text();
                        g=$('td', this).eq(7).text();
                        h=$('td', this).eq(8).text();
                        i=$('td', this).eq(9).text();
                        enabledButton();
                        
                        
		}
	} ); 
    
    
      $("#add").click(function(){
          $("#save").show();
          $("#update").hide();
          kosong();
          $("#dialogAdd").dialog("open");
          disabledButton();
    });  
      $("#edit").click(function(){
       $.ajax({
           data:"id="+id,
           url:"target/edit.jsp",
           success:function(data){
              $("#dialogAdd").dialog("open");
              $("#save").hide();
              $("#update").show(); 
               var w=JSON.parse(data);
                $("#line").select2("data", {id:w.line_id  ,text: w.line });
                $("#type").select2("data", {id:w.type_id  ,text: w.name });
                $("#size").select2("data", {id:w.size_id  ,text: w.size });
                $("#sch").val(w.sch);
                $("#kw1").val(w.pkw1);
                $("#kw2").val(w.pkw2);
                $("#kw3").val(w.pkw3);
                $("#kw4").val(w.pkw4);
                $("#kw5").val(w.pkw5);
           }
           
           
       });
            /*$("#dialogAdd").dialog("open");
              $("#save").hide();
              $("#update").show();     	     
              $("select#line option").each(function() { this.selected = (this.text == a); });
              $("select#type option").each(function() { this.selected = (this.text == b); });
              $("select#size option").each(function() { this.selected = (this.text == c); });
              $("#sch").val(d);
              $("#kw1").val(e);
              $("#kw2").val(f);
              $("#kw3").val(g);
              $("#kw4").val(h);
              $("#kw5").val(i);
                return false;
            */
        });
        $("#update").click(function(){            
        var aval1= "VALUE  Can't empty"; 
        var aval2= "VALUE  Can't empty"; 
        var aval3= "VALUE  Can't empty"; 
        var aval4= "VALUE  Can't empty"; 
        var aval5= "VALUE  Can't empty"; 
        var asch="Schedule Can't empty";
        var line=$("#line").val();
        var type=$("#type").val();
        var size=$("#size").val();
        var sch=$("#sch").val();
        var kw1=$("#kw1").val();
        var kw2=$("#kw2").val();
        var kw3=$("#kw3").val();
        var kw4=$("#kw4").val();
        var kw5=$("#kw5").val();
        $.ajax({
            url:"target/update.jsp",
            data:"line="+line+"&size="+size+"&type="+type+"&sch="+sch+"&kw1="+kw1+"&kw2="+kw2+"&kw3="+kw3+"&kw4="+kw4+"&kw5="+kw5+"&id="+id,
            success:function(){
                kosong();
                RefreshTable("#example","target/json.jsp");  
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
        ajax: "target/json.jsp"
        });
    $("#doneRemove").click(function(){
          $.ajax({
               data:"id="+id,
               url:"target/remove.jsp",
               success:function(){              
               RefreshTable("#example","target/json.jsp");
               disabledButton();
               closeDialog();
           }
               });
    });   
    
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Target</a></li>
    <li><a href="#">Data Target</a></li>
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
                            <td> <label>Line</label></td>
                            <td> <select id="line" style="width: 100%" ><option>Select Line</option></select></td>
                            
                        </tr>
                        <tr>
                            <td> <label>Type</label></td>
                            <td><select id="type" style="width: 100%"><option>select type</option></select></td>
                            
                        </tr>
                        <tr>
                            <td><label>Size</label></td>
                            <td> <select id="size"  style="width: 100%"><option>select size</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td><label>Schedule</label></td>
                            <td><div class="input-control text full-size"> <input type="text" id="sch" /></div></td>
                        </tr>
                        <tr >
                            <td> <label>Kw1</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="kw1" style="width: 100%" class="input" ></div></td>
                        </tr>  
                        <tr >
                            <td> <label>Kw2</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="kw2" style="width: 100%" class="input" ></div></td>
                        </tr>
                        <tr >
                            <td> <label>Kw3</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="kw3" style="width: 100%" class="input" ></div></td>
                        </tr>
                        <tr >
                            <td> <label>Kw4</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="kw4" style="width: 100%" class="input" ></div></td>
                        </tr>
                        <tr >
                            <td> <label>Kw5</label></td>
                            <td> <div class="input-control text full-size"> <input type="text" name="value" id="kw5" style="width: 100%" class="input" ></div></td>
                        </tr>
                        <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="savePersen()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
<input type="submit" id="add" class="button success" value="Add Target"/>&nbsp; <button class="button warning" id="edit" >Edit Target</button>&nbsp; <button class="button alert" id="remove" onclick="removeFormula()">Remove</button>
<table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>ID</th>
						<th>LINE</th>
						<th>TYPE</th>
						<th>SIZE</th>
                                                <th>SCHEDULE</th>
						<th>KW1</th>
                                                <th>KW2</th>
                                                <th>KW3</th>
                                                <th>KW4</th>
                                                <th>KW5</th>
                                            
            </tr>
        </thead>    
<tbody>
</tbody>
    </table>