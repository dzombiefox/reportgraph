<script>
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
        
    });
    
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Data Cost</a></li>
    <li><a href="#">Create Additional Cost</a></li>
</ul>
  <hr class="thin bg-grayLighter">
  <div class="example" data-text="Additional Cost">
    <table style="width: 80%" >
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
          
            <td><button class="button warning" onclick="newForm()">NEW COST</button>&nbsp;<button class="button primary" onclick="savePurchase()" id="save">SAVE</button></td>
</tr> 
     
       
    </table>
      
  </div>