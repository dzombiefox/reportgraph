<style>
    .other{
    height: 35px;
    margin-bottom:  5px;
    margin-top: 8px;    
}
.show_multicombo{position:absolute;display:none;background-color:#FFF;border:1px  blue;
 width:700px; height: 250px;overflow-x: hidden;overflow-y: auto;}
.show_multicombo tr:hover{background-color:#F5F5F5;cursor:pointer;}
.combo_header{background-color:#B1EBF9;}
.clear{clear:both;}
.float{float: left;margin-right:10px;}
</style>
<script> 
    function openExcell(){
         $("#dialogExcell").dialog("open");
    }
    function excell(){
        var excell=$("#excell").val();
        if(excell=="New"){
            document.location='cost/profit.jsp';
        }
        else{
          document.location='cost/profitOld.jsp';
        }
       
        
    }
    function getPersen(data){
                        $("#persen").val(data);
                    }
    function getData(){    
        var persen=$("#persen").val();    
        var nama=$("#name").val();
        var keluar = { "nama":"","persen":""};
        keluar.nama=nama;
        keluar.persen=persen;
         var json = JSON.stringify(keluar);       
         $.ajax({
            data: {data:json},
            url:"cost/getData.jsp",
            success:function(data){                   
                var w=JSON.parse(data);
                $("#hpp1").val(parseFloat(w.hpp1));
                $("#sell1").val(parseFloat(w.sell1));     
                $("#hpp2").val(parseFloat(w.hpp2));
                $("#sell2").val(parseFloat(w.sell2));    
                $("#hpp3").val(parseFloat(w.hpp3));
                $("#sell3").val(parseFloat(w.sell3));    
                $("#hpp4").val(parseFloat(w.hpp4));
                $("#sell4").val(parseFloat(w.sell4));    
                $("#hpp5").val(parseFloat(w.hpp5));
                $("#sell5").val(parseFloat(w.sell5));    
                $("#tanggal").focus();
                                    }
        });
    }
function cekData(id){
        var keluar = { "id":""};
        keluar.id=id;      
        var json = JSON.stringify(keluar);     
        $.ajax({
            data: {data:json},
            url:"cost/getView.jsp",
            success:function(data){                   
                var w=JSON.parse(data);
                $("#hpp1").val(parseFloat(w.hpp1));
                $("#sell1").val(parseFloat(w.sell1));     
                $("#hpp2").val(parseFloat(w.hpp2));
                $("#sell2").val(parseFloat(w.sell2));    
                $("#hpp3").val(parseFloat(w.hpp3));
                $("#sell3").val(parseFloat(w.sell3));    
                $("#hpp4").val(parseFloat(w.hpp4));
                $("#sell4").val(parseFloat(w.sell4));    
                $("#hpp5").val(parseFloat(w.hpp5));
                $("#sell5").val(parseFloat(w.sell5));    
                $("#tanggal").focus();
  }
        });
        
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
    function kosong(){
      $("#name").val("");
      $("#tanggal").val("");
      $("#persen").val("");
      $("#kw1").val("");
      $("#hpp1").val("");
      $("#sell1").val("");
      $("#qty1").val("");
      $("#kw2").val("");
      $("#hpp2").val("");
      $("#sell2").val("");
      $("#qty2").val("");
      $("#kw3").val("");
      $("#hpp3").val("");
      $("#sell3").val("");
      $("#qty3").val("");
      $("#kw4").val("");
      $("#hpp4").val("");
      $("#sell4").val("");
      $("#qty4").val("");
      $("#kw5").val("");
      $("#hpp5").val("");
      $("#sell5").val("");
      $("#qty5").val("");
    }
    function countBenefit(){
        var hpp=$("#hpp").val();
        var qty=parseFloat($("#qty").val());
        var sell=parseFloat($("#sell").val());
        var total=(sell*qty)-(hpp*qty);
        $("#profit").val(total);
    }
    
     function saveCost(){
            var aname= "ITEM NAME/CODE  Can't empty";
            var adate= "Sory Date Can't empty";
            var atarget= "Sory Target Can't empty";
            var akw= "Sory Val kw Can't empty";
            var ahpp= "Sory Val hpp Can't empty";
            var asell= "Sory Val sell Can't empty";
            var aqty= "Sory Val qty Can't empty";
            var name=$("#name").val();
            var tanggal=$("#tanggal").val().replace(/\./g, '-');
            var persen=$("#persen").val();            
            var kw1=$("#kw1").val();
            var hpp1=$("#hpp1").val();
            var sell1=$("#sell1").val();        
            var kw2=$("#kw2").val();
            var hpp2=$("#hpp2").val();
            var sell2=$("#sell2").val();        
            var kw3=$("#kw3").val();
            var hpp3=$("#hpp3").val();
            var sell3=$("#sell3").val();       
            var kw4=$("#kw4").val();
            var hpp4=$("#hpp4").val();
            var sell4=$("#sell4").val();        
            var kw5=$("#kw5").val();
            var hpp5=$("#hpp5").val();
            var sell5=$("#sell5").val();       
        if(name==""){
             $.Notify({                
                content: aname,
                type: 'alert'                
            });    
            $("#name").focus();
        }
        else if(tanggal==""){
             $.Notify({                
                content: adate,
                type: 'alert'                
            });    
            $("#tanggal").focus();
            
        }
           else if(persen==""){
             $.Notify({                
                content: atarget,
                type: 'alert'                
            });    
            $("#persen").focus();
            
        }
          else if(kw1==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw1").focus();
            
        }
        else if(hpp1==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp1").focus();
            
        }
         else if(sell1==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell1").focus();
            
        }
   
        
        else if(kw2==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw2").focus();
            
        }
        else if(hpp2==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp2").focus();
            
        }
         else if(sell2==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell2").focus();
            
        }
      
        else if(kw3==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw3").focus();
            
        }
        else if(hpp3==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp3").focus();
            
        }
         else if(sell3==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell3").focus();
            
        }
       
        else if(kw4==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw4").focus();
            
        }
        else if(hpp4==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp4").focus();
            
        }
         else if(sell4==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell4").focus();
            
        }
            
       
        else if(kw5==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw5").focus();
            
        }
        else if(hpp5==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp5").focus();
            
        }
         else if(sell5==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell5").focus();
            
        }
      
       else
       {
           var keluar = { "name":"","tanggal":"" ,"persen":"","kw1":"","kw2":"","kw3":"","kw4":"","kw5":"","hpp1":"","hpp2":"","hpp3":"","hpp4":"","hpp5":"","sell1":"","sell2":"","sell3":"","sell4":"","sell5":""};
           keluar.name=name;
           keluar.tanggal=tanggal;
           keluar.persen=persen;
           keluar.kw1=kw1;
           keluar.kw2=kw2;
           keluar.kw3=kw3;
           keluar.kw4=kw4;
           keluar.kw5=kw5;
           keluar.hpp1=hpp1;
           keluar.hpp2=hpp2;
           keluar.hpp3=hpp3;
           keluar.hpp4=hpp4;
           keluar.hpp5=hpp5;
           keluar.sell1=sell1;
           keluar.sell2=sell2;
           keluar.sell3=sell3;
           keluar.sell4=sell4;
           keluar.sell5=sell5;
           var json = JSON.stringify(keluar);
           //alert(json);
            $.ajax({
            url:"cost/save.jsp",
            data: {data:json},
            success:function(data){
            kosong();
            RefreshTable("#example","cost/jsonReport.jsp");
            }
            
        });
    }
    }
    
   
    function updateCost(){
        var aname= "ITEM NAME/CODE  Can't empty";
        var adate= "Sory Date Can't empty";
        var atarget= "Sory Target Can't empty";
        var akw= "Sory Val kw Can't empty";
        var ahpp= "Sory Val hpp Can't empty";
        var asell= "Sory Val sell Can't empty";
        var aqty= "Sory Val qty Can't empty";
        var name=$("#name").val();
        var tanggal=$("#tanggal").val().replace(/\./g, '-');
        var id=$("#id").val();
        var persen=$("#persen").val();
        var kw1=$("#kw1").val();
        var hpp1=$("#hpp1").val();
        var sell1=$("#sell1").val();        
        var kw2=$("#kw2").val();
        var hpp2=$("#hpp2").val();
        var sell2=$("#sell2").val();        
        var kw3=$("#kw3").val();
        var hpp3=$("#hpp3").val();
        var sell3=$("#sell3").val();       
        var kw4=$("#kw4").val();
        var hpp4=$("#hpp4").val();
        var sell4=$("#sell4").val();        
        var kw5=$("#kw5").val();
        var hpp5=$("#hpp5").val();
        var sell5=$("#sell5").val();       
        if(name==""){
             $.Notify({                
                content: aname,
                type: 'alert'                
            });    
            $("#name").focus();
        }
        else if(tanggal==""){
             $.Notify({                
                content: adate,
                type: 'alert'                
            });    
            $("#tanggal").focus();
            
        }
           else if(persen==""){
             $.Notify({                
                content: atarget,
                type: 'alert'                
            });    
            $("#sch").focus();
            
        }
          else if(kw1==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw1").focus();
            
        }
        else if(hpp1==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp1").focus();
            
        }
         else if(sell1==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell1").focus();
            
        }  
        else if(kw2==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw2").focus();
            
        }
        else if(hpp2==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp2").focus();
            
        }
         else if(sell2==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell2").focus();
            
        }
      
        else if(kw3==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw3").focus();
            
        }
        else if(hpp3==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp3").focus();
            
        }
         else if(sell3==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell3").focus();
            
        }
       
        else if(kw4==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw4").focus();
            
        }
        else if(hpp4==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp4").focus();
            
        }
         else if(sell4==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell4").focus();
            
        }
            
       
        else if(kw5==""){
             $.Notify({                
                content: akw,
                type: 'alert'                
            });    
            $("#kw5").focus();
            
        }
        else if(hpp5==""){
             $.Notify({                
                content: ahpp,
                type: 'alert'                
            });    
            $("#hpp5").focus();
            
        }
         else if(sell5==""){
             $.Notify({                
                content: asell,
                type: 'alert'                
            });    
            $("#sell5").focus();
            
        }
      
       else
       {
           var keluar = { "id":"","name":"","tanggal":"" ,"persen":"","kw1":"","kw2":"","kw3":"","kw4":"","kw5":"","hpp1":"","hpp2":"","hpp3":"","hpp4":"","hpp5":"","sell1":"","sell2":"","sell3":"","sell4":"","sell5":""};
           keluar.id=id;
           keluar.name=name;
           keluar.tanggal=tanggal;
           keluar.persen=persen;
           keluar.kw1=kw1;
           keluar.kw2=kw2;
           keluar.kw3=kw3;
           keluar.kw4=kw4;
           keluar.kw5=kw5;
           keluar.hpp1=hpp1;
           keluar.hpp2=hpp2;
           keluar.hpp3=hpp3;
           keluar.hpp4=hpp4;
           keluar.hpp5=hpp5;
           keluar.sell1=sell1;
           keluar.sell2=sell2;
           keluar.sell3=sell3;
           keluar.sell4=sell4;
           keluar.sell5=sell5;
           var json = JSON.stringify(keluar);
           $.ajax({
            url:"cost/update.jsp",
            data: {data:json},
            success:function(data){
            kosong();
            RefreshTable("#example","cost/jsonReport.jsp");
            $("#dialogAdd").dialog("close");
            }
            
        });
    }
    }
    $(document).ready(function(){
      $("#btn_arrow").click(function(e){
          e.preventDefault();
         $.getJSON("jsonData/jsonPersen.jsp",function(data){
              var combo = "<table name='list_combo' cellpadding='2' cellspacing='2' class='condensed  dataTable' id='koko'><thead><th>Line</th><th>Type</th><th>Size</th><th>Schedule</th></thead><tbody>";
         $.each(data,function(index,item) 
         
    {
      combo +="<tr class='rows' key='"+item.id+"' onClick='getPersen("+item.id+")'><td>"+item.line+"</td><td>"+item.name+"</td><td>"+item.size+"</td><td>"+item.sch+"</td></tr>";
    });
      combo +="</tbody></table>";
     $("#show_multicombo").html(combo).fadeIn();
    });
    
      });
         $("body #cont").click(function(){
        $("#show_multicombo").fadeOut();					
    });
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
           $("#qty").number( true );
           $("#sell").number( true );
           $("#profit").number( true );
          var table=$("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "cost/jsonReport.jsp",
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
                        {
				"targets": [ 2],
				"visible": false,
				"searchable": true
			}
			
		],
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
       
        $("#id").val(id);
        $("#update").show();
        $("#save").hide();
        $("#dialogAdd").dialog("open");
        $("#name").val(kode);
        $("#tanggal").val(date);
        $("#persen").val(persen);
        $("#kw1").val(kw1);
        $("#kw2").val(kw2);
        $("#kw3").val(kw3);
        $("#kw4").val(kw4);
        $("#kw5").val(kw5);
        
       
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
                       persen=table.fnGetData(this,2);
                       date=$('td', this).eq(1).text();
                       date=date.replace("-",".");
                       date=date.replace("-",".");
                       kode=$('td', this).eq(2).text();
                       line=$('td', this).eq(3).text();
                       kw1=$('td', this).eq(6).text();
                       var kw1e=kw1.split("(");
                       kw1=kw1e[0];
                       kw2=$('td', this).eq(7).text();
                       var kw2e=kw2.split("(");
                       kw2=kw2e[0];
                       kw3=$('td', this).eq(8).text();
                       var kw3e=kw3.split("(");
                       kw3=kw3e[0];
                       kw4=$('td', this).eq(9).text();
                       var kw4e=kw4.split("(");
                       kw4=kw4e[0];
                       kw5=$('td', this).eq(10).text();
                       var kw5e=kw5.split("(");
                       kw5=kw5e[0];
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
                url:"cost/remove.jsp",
                success:function(){
                    $("#dialogRemove").dialog("close"); 
                RefreshTable("#example","cost/jsonReport.jsp");    
                
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
            document.location="admin.jsp?page=cost/grafik&begin="+begin+"&end="+end+"&line="+line+"&up="+up+"&down="+down+"&width="+width+"";
            
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
         </div><br>
         <br>
         
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
            <td >ITEM NAME/CODE</td>
          
            <td ><div class="input-control text full-size">
                    <input type="hidden" id="id" >
                    <input type="text" id="name" maxlength="12"><button class="button" onclick="getData()"><span class="mif-database"></span></button></div>
          </td>
</tr>
        
           <tr>
            <td>Date </td>
          
            <td><div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="tanggal">
        <button class="button"><span class="mif-calendar"></span></button>
    </div> </td>
</tr>
<tr>
            <td>Target</td>
          
            <td><div id="cont">	
			
				
	<div class="combo_group" id="combo_group">
            <div class="input-control text full-size" >
						<input type="text" name="nim" id="persen" readonly class="main_input" />
						
                                                <button class="button btn_arrow" id="btn_arrow"><span class="dropdown-toggle"></span></button>
            </div>
                                                <div id="show_multicombo" class="show_multicombo"></div>
		            </div>
				
		   
                            
		    
		
			
		</div>
            
                </td>
</tr>
<tr>
            <td>&nbsp;KW 1&nbsp;</td>
          
            <td>
                <input type="text" id="kw1" value="0"  class="other">
&nbsp;HPP &nbsp
                    <input type="text" id="hpp1"  value="0" readonly class="other">
&nbsp;Sell&nbsp;
                    <input type="text" id="sell1"  value="0" readonly class="other">

           </td>
</tr>  
<tr>
            <td>&nbsp;KW 2&nbsp;</td>
          
            <td>
                    <input type="text" id="kw2"  value="0" class="other" >
&nbsp;HPP &nbsp;
                    <input type="text" id="hpp2" value="0" readonly class="other">
&nbsp;Sell&nbsp;
                    <input type="text" id="sell2"  value="0" readonly class="other">

           </td>
</tr>   
 <tr>
            <td>&nbsp;KW 3&nbsp;</td>
          
            <td>
                    <input type="text" id="kw3"  value="0" class="other">
&nbsp;HPP &nbsp;
    <input type="text" id="hpp3"  value="0" readonly class="other">
&nbsp;Sell&nbsp;
                    <input type="text" id="sell3" value="0" readonly class="other">

           </td>
</tr>  
 <tr>
            <td>&nbsp;KW 4&nbsp;</td>
          
            <td>
                    <input type="text" id="kw4" value="0"  class="other">
&nbsp;HPP &nbsp;
                    <input type="text" id="hpp4" value="0" readonly class="other">
&nbsp;Sell&nbsp;
                    <input type="text" id="sell4" value="0" readonly class="other">

          </td>
</tr>
 <tr>
            <td>&nbsp;KW 5&nbsp;</td>
          
            <td>
                    <input type="text" id="kw5" value="0" class="other">
&nbsp;HPP &nbsp;
                    <input type="text" id="hpp5" value="0" readonly class="other">
&nbsp;Sell&nbsp;
                    <input type="text" id="sell5"  value="0" readonly class="other">

          </td>
</tr>

           <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveCost()" id="save">SAVE</button>&nbsp;<button class="button primary" onclick="updateCost()" id="update" >UPDATE</button>&nbsp;<button class="button success" onclick="kosong()" >CLEAR</button></td>
</tr> 
     
       
    </table>
        </div>
        
    
    
  
<button class="button success" id="add">Add Price Cost</button>&nbsp;  <button class="button info" id="editData">Edit Data</button>&nbsp;<button class="button alert" id="remove">Remove</button>&nbsp; <button class="button primary" id="grafik">Option</button>&nbsp; <button class="button default" id="sink">Sinc Price</button>&nbsp;<button class="button default" id="excell" onclick="openExcell()">Export Excell</button>
 <table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
                        <thead>
                        <tr>
                            <th >No</th>
                            <th >ID </th>
                            <th >persen id</th>
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
                            
                        </tr>
                        </thead>
                        <tbody >                       
                        
                        </tbody>
                    </table>
