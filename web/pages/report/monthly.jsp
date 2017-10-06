<%@page import="java.text.NumberFormat"%>
<%@page import="java.sql.ResultSet"%>

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
<style type="text/css">
      .inner {
  overflow-x:scroll;
  overflow-y:visible;
  width:98%; 
  
}
.tg  {border-collapse:collapse;border-spacing:0;border-color:#aaa;}
.tg td{font-family:Arial, sans-serif;font-size:9px;padding:10px 5px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#aaa;color:#333;background-color:#fff;border-top-width:1px;border-bottom-width:1px;}
.tg th{font-family:Arial, sans-serif;font-size:9px;font-weight:normal;padding:6px 3px;border-style:solid;border-width:0px;overflow:hidden;word-break:normal;border-color:#aabcfe;color:#333;background-color:#b9c9fe;}
.tg .tg-z2zr{background-color:#FCFBE3}
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
       <table class="tg condensed border bordered dataTable"  data-auto-width="false" id="example" >
           <thead>
  <tr>
   <th>No</th>
    <th >No PO</th>
    <th >Motif</th>
    <th>Box</th>
    <th>M2</th>
    <th>/M2</th>
    <th>/Box</th>
      <th >Purchase costs</th>
    <th>Import EXP</th>
    <th>Ocean Frieght</th>
    <th>Control fee</th>
    <th>Verify</th>
    <th>Trucking</th>
    <th>CustomFee</th>
    <th>Loan Interest</th>
    <th>Other Exp</th>
      <th>KCI depo</th>
       <th>Sales /box</th>
       <th>Total Cost</th>
  </tr>
           </thead>
           <tbody></tbody>
</table>
   </div>