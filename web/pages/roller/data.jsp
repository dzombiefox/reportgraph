<script>
    function saveRoller(){
       var acd= "Code  Can't empty"; 
       var aname= "Name  Can't empty"; 
       var apt= "price  Can't empty"; 
  var cd=$("#cd").val();
  var nm=$("#nm").val();
  var sc=$("#sc").val();
  var st=$("#st").val();
  var it=$("#lt").val();
  var pt=$("#pr").val();
  var prp=$("#prp").val();
  var mtv=$("#mtv").val();
        if(cd=="") {
      $.Notify({                
                content: acd,
                type: 'alert'                
            });    
            $("#cd").focus(); 
      
  }
  else if(nm=="") {
     $.Notify({                
                content: aname,
                type: 'alert'                
            });    
            $("#nm").focus(); 
      
  }
  else if(pt=="") {
      $.Notify({                
                content: apt,
                type: 'alert'                
            });    
            $("#pr").focus(); 
      
  }
  else{

         $.ajax({
       url:"roller/save.jsp",
       data:"&cd="+cd+"&nm="+nm+"&sc="+sc+"&st="+st+"&it="+it+"&pt="+pt+"&prp="+prp+"&mtv="+mtv,
        success:function(){           
        clear();
        RefreshTable("#example","roller/json.jsp");
      }
  });
  }
    }
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
        $("#cd").val("");
        $("#nm").val("");
        $("#sc").val("");
        $("#mtv").val("");
        $("#st").val("");
        $("#lt").val("");
        $("#pr").val("");
        $("#prp").val("");
    }
    function batasiAngka(angka,digit){
    return angka.toFixed(digit);
    }       
    $(document).ready(function(){
        $("#clear").click(function(){
            clear();
        });
    $("#mtv").change(function(){
        $("#pr").val("");
        $("#prp").val("");
        var mtv=$("#mtv").val();
        var x=50000;
        var y=100000;
        if(mtv=='RANDOM'){
            $("#lt").val(y);
            
        }
        else  if(mtv=='CENTER'){
            $("#lt").val(x);
            
        }
        else{
            $("#lt").val(0);
            
        }
        
    });  
     $("#price").keyup(function(){
      var pr=$("#price").val();  
      var lt=$("#lTime").val();
      var h=batasiAngka(parseFloat(pr)/parseFloat(lt),2);
      if(isNaN(h)){
      $("#pPrint").val(0);
  }
  else{
       $("#pPrint").val(h);
  }
        
    });
      $("#pr").keyup(function(){
      var pr=$("#pr").val();  
      var lt=$("#lt").val();
      var h=batasiAngka(parseFloat(pr)/parseFloat(lt),2);
      if(isNaN(h)){
      $("#prp").val(0);
  }
  else{
       $("#prp").val(h);
  }
        
    });
       $("#motiv").change(function(){
        $("#price").val("");
        $("#pPrint").val("");
        var mtv=$("#motiv").val();
        var x=50000;
        var y=100000;
        if(mtv=='RANDOM'){
            $("#lTime").val(y);
            
        }
        else  if(mtv=='CENTER'){
            $("#lTime").val(x);
            
        }
        else{
            $("#lTime").val(0);
            
        }
        
    });
        var idItem="";
        var kode="";
        var nama="";
        var subCode="";
        var status="";
        var motiv="";
        var time="";
        var price="";
        var print="";
        $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
            clear();
        $("#dialogAdd").dialog("open");
         disabledButton();
    })
    $("#doneRemove").click(function(){
       $.ajax({
               data:"id="+idItem,
               url:"roller/delete.jsp",
               success:function(){  
                   closeDialog();
               RefreshTable("#example","roller/json.jsp");
               disabledButton();
               
               }
                
            });
    });
    $("#edit").click(function(){
              $("#save").hide();
              $("#update").show();  
              $("#dialogAdd").dialog("open"); 
              $("#cd").val(kode);
              $("#nm").val(nama);
              $("select#sc option").each(function() { this.selected = (this.text == subCode); });
              $("select#st option").each(function() { this.selected = (this.text == status); });
              $("select#mtv option").each(function() { this.selected = (this.text == motiv); });
              $("#lt").val(time);
              $("#pr").val(price);
              $("#prp").val(print);
                return false;        
    });
    $("#update").click(function(){
          var code=$("#cd").val();
        var name=$("#nm").val();
        var sCode=$("#sc").val();
        var motiv=$("#mtv").val();
        var status=$("#st").val();
        var lTime=$("#lt").val();
        var price=$("#pr").val();
        var pPrint=$("#prp").val();
    $.ajax({
       type:"POST", 
       url:"roller/update.jsp",
       data:"&id="+idItem+"&code="+code+"&name="+name+"&sCode="+sCode+"&motiv="+motiv+"&status="+status+"&lTime="+lTime+"&price="+price+"&pPrint="+pPrint,
        success:function(){    
        clear();
        $("#dialogAdd").dialog("close")
        RefreshTable("#example","roller/json.jsp");
        disabledButton();
      }
    })   
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
        ajax: "roller/json.jsp"
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
                        subCode=$('td', this).eq(4).text();
                        status=$('td', this).eq(5).text();
                        motiv=$('td', this).eq(3).text();
                        time=$('td', this).eq(6).text();
                        price=$('td', this).eq(7).text();
                        print=$('td', this).eq(8).text();
                        enabledButton();
		}
	} ); 
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Roller</a></li>
    <li><a href="#">Data Roller</a></li>
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
                            <td> <label>CODE</label></td>
                            <td> <div class="input-control select full-size"><input name="cd" id="cd" /></div></td>
                            
                        </tr>
                        <tr>
                            <td> <label>NAME</label></td>
                            <td><div class="input-control text full-size"><input name="nm" id="nm" /></div></td>                            
                        </tr>
                        <tr>
                            <td> <label>SUB CODE</label></td>
                            <td><div class="input-control text full-size">
                                    <select id="sc"  >   
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
  </select></div></td>                            
                        </tr>
                        <tr>
                            <td> <label>STATUS</label></td>
                            <td><div class="input-control text full-size">
                                    <select id="st" >        
                                    <option>OK</option>
                                    <option>NOT OK</option>
                                     </select></div></td>                            
                        </tr>    
                        <tr>
                            <td> <label>MOTIF</label></td>
                            <td><div class="input-control text full-size">
                                    <select id="mtv" >      
                                    <option>RANDOM</option>
                                    <option>CENTER</option>
                                    </select></div></td>                            
                        </tr> 
                         <tr>
                            <td> <label>LIFE TIME</label></td>
                            <td><div class="input-control text full-size">
                                    <input name="lt" id="lt" /></div></td>                            
                        </tr> 
                         <tr>
                            <td> <label>PRICE</label></td>
                            <td><div class="input-control text full-size">
                                  <input name="pr" id="pr" /></div></td>                            
                        </tr> 
                         <tr>
                            <td> <label>PRICE / PRINTING</label></td>
                            <td><div class="input-control text full-size">
                                    <input name="prp" id="prp" readonly="readonly"/></div></td>                            
                        </tr> 
                        <tr>
                            
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveRoller()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<input type="submit" value="CLEAR" class="button success" id="clear" /></td>
</tr> 
                    </table>
 
 </div>
<input type="submit" id="add" class="button success" value="Add Roller"/>&nbsp; <button class="button warning" id="edit" >Edit Roller</button>&nbsp; <button class="button alert" id="remove" onclick="removeMotif()">Remove</button>   

                <table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>ID</th>
						<th>Roller Code</th>
						<th>Roller Name</th>
						<th>Roller Motiv</th>
						<th>Sub Code</th>
                                                <th>Status</th>
                                                <th>Life Time</th>
                                                <th>Price</th>
                                                <th>Price / Printing</th>
            </tr>
        </thead>
 
     
 
        <tbody>
           
          
        </tbody>
    </table>
         