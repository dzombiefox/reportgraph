<script> 
    function updateCost(id){
        var adate= "date  Can't empty";
        var akw1= "Sory kw1 Can't empty";
        var akw2= "Sory kw2 Can't empty";
        var akw3= "Sory kw3 Can't empty";
        var akw4= "Sory kw4 Can't empty";
        var akw5= "Sory kw5 Can't empty";
        var date=$("#date").val();
        var price=$("#price").val();
        var kw1=$("#kw1").val();
        var kw2=$("#kw2").val();
        var kw3=$("#kw3").val();
        var kw4=$("#kw4").val();
        var kw5=$("#kw5").val();     
        var kw6=$("#kw6").val(); 
        var keluar = { "date":"","price":"" ,"kw1":"","kw2":"","kw3":"","kw4":"","kw5":"","kw6":"","id":""};
         keluar.date=date;
         keluar.price=price;
         keluar.kw1=kw1;
         keluar.kw2=kw2;
         keluar.kw3=kw3;
         keluar.kw4=kw4;
         keluar.kw5=kw5;
         keluar.kw6=kw6;
         keluar.id=id;
         var json = JSON.stringify(keluar);
     
        if(date==""){
             $.Notify({                
                content: adate,
                type: 'alert'                
            });    
            $("#date").focus();
        }
        else   if(kw1==""){
             $.Notify({                
                content: akw1,
                type: 'alert'                
            });    
            $("#kw1").focus();
        }
        else{  
            $.ajax({
            url:"sch/update.jsp",
            data: {data:json},
            success:function(data){
                 RefreshTable("#example","sch/json.jsp"); 
                 $("#dialogAdd").dialog("close"); 
            }
        });
        
        }
    }
    function cekData(id){
         $("#dialogAdd").dialog("open");
       $.ajax({
           data:"id="+id,
           url:"sch/edit.jsp",
           success:function(data){
                var w=JSON.parse(data);
                var target=w.code+"  ("+w.periode+" ("+w.year+") ) "+w.line;
                $("#price").select2("data", { id:w.id ,text: target });
                $("#date").val(w.date);
                $("#kw1").val(w.kw1);
                $("#kw2").val(w.kw2);
                $("#kw3").val(w.kw3);
                $("#kw4").val(w.kw4);
                $("#kw5").val(w.kw5);
                $("#kw6").val(w.kw6);
           }
           
       });
    }
    function kosong(){
        $("#date").val("");
        $("#price").val("");
        $("#kw1").val("");
        $("#kw2").val("");
        $("#kw3").val("");
        $("#kw4").val("");
        $("#kw5").val("");   
        
    }
     function savePrice(){
        var adate= "date  Can't empty";
        var akw1= "Sory kw1 Can't empty";
        var akw2= "Sory kw2 Can't empty";
        var akw3= "Sory kw3 Can't empty";
        var akw4= "Sory kw4 Can't empty";
        var akw5= "Sory kw5 Can't empty";
        var akw6= "Sory kw6 Can't empty";
        var date=$("#date").val();
        var price=$("#price").val();
        var kw1=$("#kw1").val();
        var kw2=$("#kw2").val();
        var kw3=$("#kw3").val();
        var kw4=$("#kw4").val();
        var kw5=$("#kw5").val();  
        var kw6=$("#kw6").val(); 
        var keluar = { "date":"","price":"" ,"kw1":"","kw2":"","kw3":"","kw4":"","kw5":"","kw6":""};
         keluar.date=date;
         keluar.price=price;
         keluar.kw1=kw1;
         keluar.kw2=kw2;
         keluar.kw3=kw3;
         keluar.kw4=kw4;
         keluar.kw5=kw5;
         keluar.kw6=kw6;
         var json = JSON.stringify(keluar);
            if(date==""){
             $.Notify({                
                content: adate,
                type: 'alert'                
            });    
            $("#date").focus();
        }
        else   if(kw1==""){
             $.Notify({                
                content: akw1,
                type: 'alert'                
            });    
            $("#kw1").focus();
        }
        else{        
            $.ajax({
            url:"sch/save.jsp",
            data: {data:json},
            success:function(data){
                kosong();
                 RefreshTable("#example","sch/json.jsp"); 
                 $("#dialogAdd").dialog("close"); 
            }
        });
        
            
            
            
  }
        
    }
    function openExcell(){
         $("#dialogExcell").dialog("open");
    }
    function excell(){
        var excell=$("#excell").val();
		var d1=$("#d1").val();
		var d2=$("#d2").val();
        if(excell=="New"){
         document.location='cost/profit.jsp?d1='+d1+"&d2="+d2;
        }
        else{
          document.location='cost/profitOld.jsp';
        }
       
        
    }
  
function validate(evt) {
  var theEvent = evt || window.event;
  var key = theEvent.keyCode || theEvent.which;
  key = String.fromCharCode( key );
  var regex = /[0-9]|\./;
  if( !regex.test(key) ) {
    theEvent.returnValue = false;
    if(theEvent.preventDefault) theEvent.preventDefault();
  }
} 
$(document).ready(function(){  
        var price;
        $.getJSON("sch/getItem.jsp",function(data){
    $.each(data,function(index,item) 
    {
      price+="<option value='"+item.id+"'>"+item.code+"  ("+item.periode+" ("+item.year+") ) "+item.line+"</option>";
    });
    $("#price").html(price); 
       
  });
    $("#price").select2();
      
        $("#sincPrice").click(function(){
            var bulan=$("#bulan").val();
            $.ajax({
                data:"bulan="+bulan,
                url:"cost/sincPrice.jsp",
                success:function(data){
                    alert(data);
                }
                
            });
            
        });
        $("#update").hide();
        $("#editData").attr("disabled","disabled");
        $("#remove").attr("disabled","disabled");
        var kode,date,persen,kw1,kw2,kw3,kw4,kw5,hpp,hpp2,hpp2,hpp3,hpp4,hpp5,sell1,sell2,sell3,sell4,sell5;
            var id;
            $("#sch").number( true );
            $("#kw1").number( true );
            $("#kw2").number( true );
            $("#kw3").number( true );
            $("#kw4").number( true );
            $("#kw5").number( true );
            $("#kw6").number( true );
            $("#sell1").number( true );
            $("#sell2").number( true );
            $("#sell3").number( true );
            $("#sell4").number( true );
            $("#sell5").number( true );
            $("#hpp1").number( true );
            $("#hpp2").number( true );
            $("#hpp3").number( true );
            $("#hpp4").number( true );
            $("#hpp5").number( true );
            $("#hpp6").number( true );
           $("#qty").number( true );
           $("#sell").number( true );
           $("#profit").number( true );
          var table=$("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "sch/json.jsp",
        "sDom": "Tlfrtip ",
        "tableTools": {
            "sSwfPath": "swf/copy_csv_xls_pdf.swf",            
             "aButtons": [
        {
            "sExtends": "copy",
            "oSelectorOpts": { filter: 'applied', order: 'current' }
        },
        {
            "sExtends": "xls",
            "oSelectorOpts": { filter: 'applied', order: 'current' },
            "sFileName": "file.xls"
        },
             
        {
            "sExtends": "print",
            "oSelectorOpts": { filter: 'applied', order: 'current' },
        }
        ]
        },
            "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			},
                        
		],
        }); 
$("#update").click(function(){
    updateCost(id);
});        
$("#sink").click(function(){
    $("#dialogSinc").dialog("open");
    
});        
$("#add").click(function(){
        $("#save").show(); 
        $("#update").hide();
        $("#dialogAdd").dialog("open");
        kosong();
    });
    
   $(".dialog-close-button").click(function(){
     kosong();
       
   });
    $("#editData").click(function(){      
        cekData(id);
        $("#save").hide();
        $("#update").show();
             
    });
    
    $("#grafik").click(function(){
        $("#dialogGrafik").dialog("open");
        
    });
       var line="";
     $.getJSON("cost/getLine.jsp",function(data){
         $.each(data,function(index,item) 
    {
      line+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    // $("#line").html(line); 
     $("#lines").html(line); 
     $("#lineGrafik").html(line);
      });
      
         $('#example tbody').on( 'click', 'tr', function () {
      		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
		       table.$('tr.selected').removeClass('selected');
		       $(this).addClass('selected');
                       id= table.fnGetData( this, 1 );
                       $("#editData").removeAttr("disabled");
                       $("#remove").removeAttr("disabled");
                    
                    }           
	} ); 
          $("#cancel").click(function(){            
          $("#dialogRemove").dialog("close");   
        });
        $("#ok").click(function(){
                $.ajax({
                data:"id="+id,
                url:"sch/remove.jsp",
                success:function(){
                    $("#dialogRemove").dialog("close"); 
                RefreshTable("#example","sch/json.jsp");    
                
                }
                
            });
            
        });
        $("#remove").click(function(){
        $("#dialogRemove").dialog("open");    
        
        });
         $("#sinc").click(function(){
            var begin=$("#begin").val().replace(/\./g, '-');
            var end=$("#end").val().replace(/\./g, '-');
            var line=$("#lineGrafik").val();
            $.ajax({
                data:"begin="+begin+"&end="+end+"&line="+line,
                url:"cost/sincronize.jsp",
                success:function(data){                 
                        alert("success sincronize");
                }
            });
            //document.location="admin.jsp?page=cost/grafik&begin="+begin+"&end="+end+"&line="+line+"";
            
        });
        $("#look").click(function(){
            var begin=$("#begin").val().replace(/\./g, '-');
            var end=$("#end").val().replace(/\./g, '-');
            var line=$("#lineGrafik").val();
			var up=$("#up").val();
			var down=$("#down").val();
			var width=$("#width").val();
            document.location="admin.jsp?page=sch/grafik&begin="+begin+"&end="+end+"&line="+line+"&up="+up+"&down="+down+"&width="+width+"";
            
        });
          $("#viewData").click(function(){
            var begin=$("#begin").val().replace(/\./g, '-');
            var end=$("#end").val().replace(/\./g, '-');
            var line=$("#lineGrafik").val();
            document.location="admin.jsp?page=cost/viewData&begin="+begin+"&end="+end+"&line="+line+"";
            
        });
    });
    
</script>

<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Data Cost</a></li>
    <li><a href="#">Create Cost</a></li>
</ul>
<div data-role="dialog" id="dialogExcell" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width:500px;">
<div class="input-control text full-size" >
    <br>     
    <select id="excell" style="width: 300px">
        <option>New</option>
        <option>Old</option>
    </select>
         </div><br><p></p>
		 <div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="d1">
        <button class="button"><span class="mif-calendar"></span></button>
    </div>
         <br>
         <p></p>
		 <div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="d2">
        <button class="button"><span class="mif-calendar"></span></button>
    </div>
         <input type="submit" value="Export Excell" id="export" class="button default" onclick="excell()"/>
</div>
 <div data-role="dialog" id="dialogGrafik" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width:500px;">
         <br><label>Start Date </label><br>
         <div class="input-control text full-size" data-role="datepicker">
             <input type="text" id="begin" style="width: 700px">
        <button class="button"><span class="mif-calendar"></span></button>
         </div><br>
         <label>End Date</label><br>
         <div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="end">
        <button class="button"><span class="mif-calendar"></span></button>
    </div>
         <label>Line</label><br>
           <div class="input-control text full-size" >
                    <select id="lineGrafik">
                        
                    </select>
    </div>
	
	<label>Setup </label><br>
           <div class="input-control text full-size" >
                     <div class="input-control text full-size">
             UP&nbsp;&nbsp;<input type="text" id="up" style="width: 100px">&nbsp; DOWN&nbsp;&nbsp;<input type="text" id="down" style="width: 100px">&nbsp; Width&nbsp;&nbsp;<input type="text" id="width" style="width: 100px">
       
         </div>
    </div>
	<br><br>
        <button class="button primary" id="look">View Grafik </button>&nbsp;<button class="button success" id="viewData">View Data </button>&nbsp;<button></button>
     </div>

 <div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="ok">OK</button>&nbsp; <button class="button default" id="cancel">Cancel</button>
     </div>
<div data-role="dialog" id="dialogSinc" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
    <br> 
    <div class="input-control text full-size" >
    <select id="bulan" style="width: 400px" >
        <option value="01">January</option>
        <option value="02">February</option>
        <option value="03">Marc</option>
        <option value="04">April</option>
        <option value="05">May</option>
        <option value="06">June</option>
        <option value="07">July</option>
        <option value="08">Augustus</option>
        <option value="09">September</option>
        <option value="10">October</option>
        <option value="11">November</option>
        <option value="12">December</option>
    </select>
    </div>
     <button class="button primary" id="sincPrice">Sinc Price</button>
</div>
<div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px;">
  <br>      
        <table width="980px" >
        <tr>
            <td width="200px">Date </td>          
            <td><div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="date">
        <button class="button"><span class="mif-calendar"></span></button>
        </div> </td>
        </tr>
<tr>
            <td>ITEM CODE</td>
          
            <td>
                
                <select id="price" style="width: 100%">
                        <option>Select Code</option>
                        
                    </select>
               
            
                </td>
</tr>
<tr>
            <td>&nbsp;KW 1&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                <input type="text" id="kw1" value="0"  >
                  </div>

           </td>
</tr>  
<tr>
            <td>&nbsp;KW 2&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                    <input type="text" id="kw2"   >
                  </div>

           </td>
</tr>   
 <tr>
            <td>&nbsp;KW 3&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                    <input type="text" id="kw3"  >
                  </div>

           </td>
</tr>  
 <tr>
            <td>&nbsp;KW 4&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                    <input type="text" id="kw4" value="0" >
                  </div>

          </td>
</tr>
 <tr>
            <td>&nbsp;KW 5&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                    <input type="text" id="kw5" value="0" >
                  </div>
          </td>
</tr>
 <tr>
            <td>&nbsp;KW 6&nbsp;</td>
          
            <td>
                  <div class="input-control text full-size" >
                    <input type="text" id="kw6" value="0" >
                  </div>
          </td>
</tr>

           <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="savePrice()" id="save">SAVE</button>&nbsp;<button class="button primary"  id="update" >UPDATE</button>&nbsp;<button class="button success" onclick="kosong()" >CLEAR</button></td>
</tr> 
     
       
    </table>
        </div>
        
    
    
  
<button class="button success" id="add">Add Price Cost</button>&nbsp;  <button class="button info" id="editData">Edit Data</button>&nbsp;<button class="button alert" id="remove">Remove</button>&nbsp; <button class="button primary" id="grafik">Option</button>&nbsp; <button class="button default" id="sink">Sinc Price</button>&nbsp;<button class="button default" id="excell" onclick="openExcell()">Export Excell</button>
 <table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
                        <thead>
                        <tr>
                            <th >No</th>
                            <th >ID </th>
                            <th>DATE</th>
                            <th >ITEM NAME/CODE</th>
                            <th >LINE</th>
                            <th >SCHEDULE</th>
                            <th >QUANTITY</th>
                            <th >KW 1</th>
                            <th >KW 2</th>
                            <th >KW 3</th>
                            <th >KW 4</th>
                            <th >KW 5</th>
                            <th >KW 6</th>
                            <th >Periode</th>
                        </tr>
                        </thead>
                        <tbody >                       
                        
                        </tbody>
                    </table>
