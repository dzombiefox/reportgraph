<script>
    function savePurchase(){
        var po=$("#po").val();
        var depo=$("#depo").val();
        var sales=$("#sales").val();
        $.ajax({
            url:"report/updatePurchase.jsp",
            data:"po="+po+"&depo="+depo+"&sales="+sales,
            success:function(data){
                 RefreshTable("#example","report/jsonMonthly.jsp"); 
                 $("#depo").val("");
                 $("#sales").val("");
                 $("#dialogAdd").dialog("close"); 
            }
        });
        
    }
    $(document).ready(function(){
        $("#depo").number( true );
           $("#sales").number( true );
               var motif="";
     $.getJSON("other/getPo.jsp",function(data){
         $.each(data,function(index,item) 
    {
      motif+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#po").html(motif); 
      });
           var table=$("#example").dataTable({
            "bPaginate": false,
            "bInfo" : false,
            "bFilter": false,           
        "sPaginationType": "full_numbers",
        ajax: "report/jsonMonthly.jsp"
        });
    $('#2').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(2)').show();
       $('.tg td:nth-child(2)').show();
   }
            else{
       $('.tg th:nth-child(2)').hide();
       $('.tg td:nth-child(2)').hide();
   }
});
$('#3').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(3)').show();
       $('.tg td:nth-child(3)').show();
   }
            else{
       $('.tg th:nth-child(3)').hide();
       $('.tg td:nth-child(3)').hide();
   }
});
$('#4').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(4)').show();
       $('.tg td:nth-child(4)').show();
   }
            else{
       $('.tg th:nth-child(4)').hide();
       $('.tg td:nth-child(4)').hide();
   }
});
$('#5').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(5)').show();
       $('.tg td:nth-child(5)').show();
   }
            else{
       $('.tg th:nth-child(5)').hide();
       $('.tg td:nth-child(5)').hide();
   }
});
$('#6').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(6)').show();
       $('.tg td:nth-child(6)').show();
   }
            else{
       $('.tg th:nth-child(6)').hide();
       $('.tg td:nth-child(6)').hide();
   }
});
$('#7').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(7)').show();
       $('.tg td:nth-child(7)').show();
   }
            else{
       $('.tg th:nth-child(7)').hide();
       $('.tg td:nth-child(7)').hide();
   }
});
 
 $('#8').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(8)').show();
       $('.tg td:nth-child(8)').show();
   }
            else{
       $('.tg th:nth-child(8)').hide();
       $('.tg td:nth-child(8)').hide();
   }
});
$('#9').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(9)').show();
       $('.tg td:nth-child(9)').show();
   }
            else{
       $('.tg th:nth-child(9)').hide();
       $('.tg td:nth-child(9)').hide();
   }
});
$('#10').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(10)').show();
       $('.tg td:nth-child(10)').show();
   }
            else{
       $('.tg th:nth-child(10)').hide();
       $('.tg td:nth-child(10)').hide();
   }
});
$('#11').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(11)').show();
       $('.tg td:nth-child(11)').show();
   }
            else{
       $('.tg th:nth-child(11)').hide();
       $('.tg td:nth-child(11)').hide();
   }
});
$('#12').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(12)').show();
       $('.tg td:nth-child(12)').show();
   }
            else{
       $('.tg th:nth-child(12)').hide();
       $('.tg td:nth-child(12)').hide();
   }
});
$('#13').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(13)').show();
       $('.tg td:nth-child(13)').show();
   }
            else{
       $('.tg th:nth-child(13)').hide();
       $('.tg td:nth-child(13)').hide();
   }
});
$('#14').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(14)').show();
       $('.tg td:nth-child(14)').show();
   }
            else{
       $('.tg th:nth-child(14)').hide();
       $('.tg td:nth-child(14)').hide();
   }
});
$('#15').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(15)').show();
       $('.tg td:nth-child(15)').show();
   }
            else{
       $('.tg th:nth-child(15)').hide();
       $('.tg td:nth-child(15)').hide();
   }
});
       $('#16').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(16)').show();
       $('.tg td:nth-child(16)').show();
   }
            else{
       $('.tg th:nth-child(16)').hide();
       $('.tg td:nth-child(16)').hide();
   }
});
$('#17').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(17)').show();
       $('.tg td:nth-child(17)').show();
   }
            else{
       $('.tg th:nth-child(17)').hide();
       $('.tg td:nth-child(17)').hide();
   }
});
$('#18').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(18)').show();
       $('.tg td:nth-child(18)').show();
   }
            else{
       $('.tg th:nth-child(18)').hide();
       $('.tg td:nth-child(18)').hide();
   }
});
$('#19').click(function() {
    if($(this).is(':checked')){
       $('.tg th:nth-child(19)').show();
       $('.tg td:nth-child(19)').show();
   }
            else{
       $('.tg th:nth-child(19)').hide();
       $('.tg td:nth-child(19)').hide();
   }
});          
        $("#choose").click(function(){
        $("#dialogColumn").dialog("open");      
        }); 
          $("#add").click(function(){
        $("#dialogAdd").dialog("open");  
           $(':checkbox').each(function() {
            this.checked = true;                        
        });
        $('.tg th:nth-child(2)').show();
        $('.tg td:nth-child(2)').show();
        $('.tg th:nth-child(3)').show();
        $('.tg td:nth-child(3)').show();
        $('.tg th:nth-child(4)').show();
        $('.tg td:nth-child(4)').show();
        $('.tg th:nth-child(5)').show();
        $('.tg td:nth-child(5)').show();
        $('.tg th:nth-child(6)').show();
        $('.tg td:nth-child(6)').show();
        $('.tg th:nth-child(7)').show();
        $('.tg td:nth-child(7)').show();
        $('.tg th:nth-child(8)').show();
        $('.tg td:nth-child(8)').show();
        $('.tg td:nth-child(9)').show();
        $('.tg td:nth-child(9)').show();        
        $('.tg th:nth-child(10)').show();
        $('.tg td:nth-child(10)').show();
        $('.tg th:nth-child(11)').show();
        $('.tg td:nth-child(11)').show();
        $('.tg th:nth-child(12)').show();
        $('.tg td:nth-child(12)').show();
        $('.tg th:nth-child(13)').show();
        $('.tg td:nth-child(13)').show();
        $('.tg th:nth-child(14)').show();
        $('.tg td:nth-child(14)').show();
        $('.tg th:nth-child(15)').show();
        $('.tg td:nth-child(15)').show();
        $('.tg th:nth-child(16)').show();
        $('.tg td:nth-child(16)').show();
        $('.tg td:nth-child(17)').show();
        $('.tg td:nth-child(17)').show();        
        $('.tg th:nth-child(18)').show();
        $('.tg td:nth-child(18)').show();
        $('.tg th:nth-child(19)').show();
        $('.tg td:nth-child(19)').show();
       }); 
    });
</script>
<style>
         .inner {
  overflow-x:scroll;
  overflow-y:visible;
  width:100%; 
  
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
    <li><a href="#">Report Purchase</a></li>
    <li><a href="#">Monthly</a></li>
</ul>
     <hr class="thin bg-grayLighter">
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
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="savePurchase()" id="save">SAVE</button></td>
</tr> 
     
       
    </table>
    </div>
     <div data-role="dialog" id="dialogColumn" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
                          <br />
                          <fieldset>
                              <legend>Hide or Show Column Table</legend>
                          <table width="500px" >
  <tr>
    <td width="120">
     <label class="input-control checkbox small-check">
         <input type="checkbox"  id="2" checked="checked">
    <span class="check"></span>
    <span class="caption">No PO</span>
</label>
    <td width="177"> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="11" checked="checked">
    <span class="check"></span>
    <span class="caption">Control Fee</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="3" checked="checked">
    <span class="check"></span>
    <span class="caption">Motif</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="12" checked="checked">
    <span class="check"></span>
    <span class="caption">Verification</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="4" checked="checked">
    <span class="check"></span>
    <span class="caption">Box</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="13" checked="checked">
    <span class="check"></span>
    <span class="caption">Trucking</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="5" checked="checked">
    <span class="check"></span>
    <span class="caption">M2</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="14" checked="checked">
    <span class="check"></span>
    <span class="caption">Custom Fee</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="6" checked="checked">
    <span class="check"></span>
    <span class="caption">/M2</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="15" checked="checked">
    <span class="check"></span>
    <span class="caption">Loan Interest</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="7" checked="checked">
    <span class="check"></span>
    <span class="caption">/Box</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="16" checked="checked"> 
    <span class="check"></span>
    <span class="caption">Other Exp</span>
</label></td>
  </tr>
  <tr>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="8" checked="checked">
    <span class="check"></span>
    <span class="caption">Purchase Cost</span>
</label></td>
    <td> <label class="input-control checkbox small-check">
         <input type="checkbox"  id="17" checked="checked">
    <span class="check"></span>
    <span class="caption">Opt exp KCI Depo</span>
</label></td>
  </tr>
  <tr>
    <td><label class="input-control checkbox small-check">
         <input type="checkbox"  id="9" checked="checked">
    <span class="check"></span>
    <span class="caption">Import Export</span>
</label></td>
    <td><label class="input-control checkbox small-check">
         <input type="checkbox"  id="18" checked="checked">
    <span class="check"></span>
    <span class="caption">Add Sales Cost / Box</span>
</label></td>
  </tr>
  <tr>
    <td><label class="input-control checkbox small-check">
         <input type="checkbox"  id="10" checked="checked">
    <span class="check"></span>
    <span class="caption">Ocean Freight</span>
</label></td>
    <td><label class="input-control checkbox small-check">
         <input type="checkbox"  id="19" checked="checked">
    <span class="check"></span>
    <span class="caption">Total Cost</span>
</label></td>
  </tr>
</table>

   </fieldset>                  
                          

               
      </div>  
      <div class="inner">
     <input type="submit" value="Hide Show Column"  id="choose"/>&nbsp;     <input type="submit" value="Additional Cost"  id="add"/>
   <div class="datagrid">
       <table  id="example" class="tg condensed border bordered dataTable">
<thead>
    <tr>
        <th>No</th>
        <th>No PO</th>
        <th>Motif</th>
        <th>Box</th>
        <th>M2</th>
        <th>/M2</th>
        <th>/Box</th>
        <th>Purchase Cost</th>
        <th>Import Exp</th>
        <th>Ocean Freight</th>
        <th>Control fee</th>
        <th>Verify</th>
        <th>Trucking</th>
        <th>Custom fee</th>
        <th>Loan Interest</th>
        <th>Other exp</th>
        <th>KCI Depo</th>
        <th>sales/box</th>
        <th>Total Cost</th>
        
    </tr>
</thead>
<!--<tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>-->
<tbody>
   
</tbody>
</table></div>
</div>