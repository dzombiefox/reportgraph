<script>
    function remove(){
      var kode=$("#kode").val();
      $.ajax({
          data:"kode="+kode,
          url:"report/remove.jsp",
          success:function(){
              $("#kode").val("");
               RefreshTable("#example","report/json.jsp");
          }
      });
        
    }
    function invoice(){
        var kode=$("#kode").val();
        if(kode==""){
            alert("pilih kode dulu");
        }
        else{
    var thePopup = window.open( 'report/invoice.jsp?kode='+kode, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=500" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print(); 
    }
}
    function print(){
    var tanggal1=$("#tanggal1").val();        
    var tanggal2=$("#tanggal2").val();  
    var thePopup = window.open( 'report/report.jsp?tanggal1='+tanggal1+"&tanggal2="+tanggal2, "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=500" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print(); 
                   }
    function kosong(){
        $("#depo").val("");
        $("#sales").val("");
        $("#sell").val("");
                     }
     function savePurchase(){
        var po=$("#po").val();
        var depo=$("#depo").val();
        var sales=$("#sales").val();
        var sell=$("#sell").val();
        $.ajax({
            url:"report/updatePurchase.jsp",
            data:"po="+po+"&depo="+depo+"&sales="+sales+"&sell="+sell,
            success:function(data){
                 RefreshTable("#example","report/json.jsp"); 
                 kosong();
                 $("#dialogAdd").dialog("close"); 
             }
        });
            }
    $(document).ready(function(){
       $("#cancel").click(function(){
            
          $("#dialogRemove").dialog("close");   
        });
        $("#ok").click(function(){
          remove();
          $("#dialogRemove").dialog("close");   
        });
         $("#remove").click(function(){
        $("#dialogRemove").dialog("open");    
        
        });    
        //remove();
      
        var kode;
            $('#example tbody').on( 'click', 'tr', function () {
      		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        $("#kode").val($('td', this).eq(1).text());
                        
                       
                    }           
	} ); 
        
           $("#depo").number( true );
           $("#sales").number( true );
           $("#sell").number( true );
           var motif="";
     $.getJSON("other/getPo.jsp",function(data){
         $.each(data,function(index,item) 
    {
      motif+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#po").html(motif); 
      });
         var table=$("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "report/json.jsp"
        });
         $("#add").click(function(){
        $("#dialogAdd").dialog("open");
        kosong();
    });
    $("#print").click(function(){
        $("#dialogPrint").dialog("open");
    });
    });
</script>
<style>
        .inner {
  overflow-x:scroll;
  overflow-y:visible;
  width:98%; 
  
}
    .datagrid table { 
    border-collapse: collapse;
    text-align: left; width: 100%; 
} 
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; 
          background: #fff; overflow: hidden; -webkit-border-radius: 3px;
          -moz-border-radius: 3px; 
          border-radius: 3px;
}
.datagrid table td, 
.datagrid table th { padding: 3px 10px; }
.datagrid table thead th {background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );
filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
background-color:#006699; color:#FFFFFF; font-size: 10px; font-weight: bold; border-left: 1px solid #0070A8; 
} 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { color: #00557F; border-left: 1px solid #E1EEF4;
font-size: 10px;font-weight: normal;
}.datagrid table tbody .alt td { background: #E1EEF4; color: #00557F; }
.datagrid table tbody td:first-child { border-left: none; }
.datagrid table tbody tr:last-child td { border-bottom: none; }
.datagrid table tfoot td div { border-top: 1px solid #006699;
background: #E1EEF4;} .datagrid table tfoot td { padding: 0; font-size: 12px } 
.datagrid table tfoot td div{ padding: 2px; }
.datagrid table tfoot td ul { margin: 0; padding:0; list-style: none;
text-align: right; }.datagrid table tfoot  li { display: inline; }

.datagrid table tfoot ul.active, 
.datagrid table tfoot ul a:hover { text-decoration: none;border-color: #00557F; color: #FFFFFF;
background: none; background-color:#006699;}div.dhtmlx_window_active, 
div.dhx_modal_cover_dv { position: fixed !important; }
</style> 
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="?page=purchase/create">Create Purchase</a></li>
    <li><a href="#">Data  Purchase</a></li></ul>
<input type="hidden" id="kode" />
<div data-role="dialog" id="dialogPrint" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
    <label>First Date</label>
    <div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="tanggal1">
        <button class="button"><span class="mif-calendar"></span></button>
    </div><br>
<!-- input[type=password] -->
<label>End Date</label>
<div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="tanggal2">
        <button class="button"><span class="mif-calendar"></span></button>
    </div><br>
<div class="input-control text full-size">
    <input type="submit" value="search" class="primary" onclick="print()">
</div>

</div>
 <div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="ok">OK</button>&nbsp; <button class="button default" id="cancel">Cancel</button>
     </div>
<div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
  
        <br><table width="700px" >
        <tr>
            <td >Number Po</td>
          
            <td ><div class="input-control text full-size">
              <select id="po" ></select>
          </div></td>
</tr>
        
           <tr>
            <td>Exp KCI Depo</td>
          
            <td><div class="input-control text medium-size">
                    <input type="text" id="depo">
                </div> </td>
</tr>
        
   <tr>
            <td>Sales Cost/Box</td>
          
            <td><div class="input-control text medium-size">
                    <input type="text" id="sales" >
</div></td>
</tr> 
   <tr>
            <td>Selling Price Depo/Box</td>
          
            <td><div class="input-control text medium-size">
                    <input type="text" id="sell" >
</div></td>
</tr> 
           <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="savePurchase()" id="save">SAVE</button></td>
</tr> 
     
       
    </table>
    </div>
<div class="datagrid">
      <div class="inner">
          <button class="button success" id="add">Add/Update Cost</button>&nbsp; <button class="button warning" id="invoice" onclick="invoice()">View Selected</button>&nbsp; <button class="button primary" id="print">Report</button>&nbsp; <button class="button alert" id="remove">Remove</button>
    
       <table  id="example" class="tg condensed border bordered dataTable">
<thead>
    <tr>
      <th rowspan="2">No</th>
       <th rowspan="2" align="center">NO PO</th>
      <th rowspan="2" align="center">Motif</th>
      <th colspan="2">Total Purch </th>
      <th colspan="2">Purch Cost</th>
      <th rowspan="2">Purch Cost</th>
      <th rowspan="2">Import Exp</th>
      <th colspan="7" align="center" >Detail Import</th>
      <th colspan="2" align="center" >Other cost</th>
      <th rowspan="2">Total Cost</th>
      <th colspan="3" >Selling Price</th>
      <th colspan="2" >Suggested Price</th>
      </tr>
    <tr>
        <th>Box</th>
        <th>M2</th>
        <th>PerM2</th>
        <th>PerBox</th>
        <th>Ocean Freight</th>
        <th>Ctrl fee</th>
        <th>Verification</th>
        <th>Trucking</th>
        <th>Custom fee</th>
        <th>Loan Interest</th>
        <th>Oth exp</th>
        <th>KCI Depo</th>
        <th>Sales/box</th>
        <th>Depo/Box</th>
        <th>Net /Box</th>
        <th>Net Profit Ratio/Box</th>
        <th>20%</th>
        <th>25%</th>
        
    </tr>
</thead>
<!--<tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>-->
<tbody>
   
</tbody>
</table>
</div>
</div>