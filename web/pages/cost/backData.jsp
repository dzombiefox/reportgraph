<script>
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
      $("#line").val("");
      $("#sch").val("");
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
          var asch= "Sory Schedule Can't empty";
          var akw= "Sory Val kw Can't empty";
          var ahpp= "Sory Val hpp Can't empty";
          var asell= "Sory Val sell Can't empty";
          var aqty= "Sory Val qty Can't empty";
        var name=$("#name").val();
        var tanggal=$("#tanggal").val().replace(/\./g, '-');
        var line=$("#line").val();
        var sch=$("#sch").val();
        var kw1=$("#kw1").val();
        var hpp1=$("#hpp1").val();
        var sell1=$("#sell1").val();
        var qty1=$("#qty1").val();
        var kw2=$("#kw2").val();
        var hpp2=$("#hpp2").val();
        var sell2=$("#sell2").val();
        var qty2=$("#qty2").val();
        var kw3=$("#kw3").val();
        var hpp3=$("#hpp3").val();
        var sell3=$("#sell3").val();
        var qty3=$("#qty3").val();
        var kw4=$("#kw4").val();
        var hpp4=$("#hpp4").val();
        var sell4=$("#sell4").val();
        var qty4=$("#qty4").val();
        var kw5=$("#kw5").val();
        var hpp5=$("#hpp5").val();
        var sell5=$("#sell5").val();
        var qty5=$("#qty5").val();
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
           else if(sch==""){
             $.Notify({                
                content: asch,
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
        else if(qty1==""){
             $.Notify({                
                content: aqty,
                type: 'alert'                
            });    
            $("#qty1").focus();
            
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
        else if(qty2==""){
             $.Notify({                
                content: aqty,
                type: 'alert'                
            });    
            $("#qty2").focus();
            
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
        else if(qty3==""){
             $.Notify({                
                content: aqty,
                type: 'alert'                
            });    
            $("#qty3").focus();
            
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
        else if(qty4==""){
             $.Notify({                
                content: aqty,
                type: 'alert'                
            });    
            $("#qty4").focus();
            
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
        else if(qty5==""){
             $.Notify({                
                content: aqty,
                type: 'alert'                
            });    
            $("#qty5").focus();
            
        }
       else
       {
        $.ajax({
            url:"cost/save.jsp",
            data:"name="+name+"&tanggal="+tanggal+"&line="+line+"&sch="+sch+"&kw1="+kw1+"&hpp1="+hpp1+"&sell1="+sell1+"&qty1="+qty1+"&kw2="+kw2+"&hpp2="+hpp2+"&sell2="+sell2+"&qty2="+qty2+"&kw3="+kw3+"&hpp3="+hpp3+"&sell3="+sell3+"&qty3="+qty3+"&kw4="+kw4+"&hpp4="+hpp4+"&sell4="+sell4+"&qty4="+qty4+"&kw5="+kw5+"&hpp5="+hpp5+"&sell5="+sell5+"&qty5="+qty5,
            success:function(data){
            kosong();
            RefreshTable("#example","cost/jsonReport.jsp");
            }
            
        });
    }
    }
    $(document).ready(function(){
        $("#view").click(function(){
             var thePopup = window.open( 'cost/grafik.jsp', "Customer Listing", "scrollbars=1,menubar=0,location=0,height=auto,width=500" );
    $('#popup-content').clone().appendTo( thePopup.document.body );
    thePopup.print(); 
        });
           $("#hpp").number( true );
           $("#qty").number( true );
           $("#sell").number( true );
           $("#profit").number( true );
          var table=$("#example").dataTable({
        "sPaginationType": "full_numbers",
        ajax: "cost/jsonReport.jsp"
        }); 
        
         $("#add").click(function(){
        $("#dialogAdd").dialog("open");
        kosong();
    });
    
       var line="";
     $.getJSON("cost/getLine.jsp",function(data){
         $.each(data,function(index,item) 
    {
      line+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#line").html(line); 
      });
        
    });
    
</script>

<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Data Cost</a></li>
    <li><a href="#">Create Cost</a></li>
</ul>
<div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
  
        <br><table width="1100px" >
        <tr>
            <td >ITEM NAME/CODE</td>
          
            <td ><div class="input-control text full-size">
                    <input type="text" id="name" maxlength="12">
          </div></td>
</tr>
        
           <tr>
            <td>Date </td>
          
            <td><div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="tanggal">
        <button class="button"><span class="mif-calendar"></span></button>
    </div> </td>
</tr>
 <tr>
            <td>Line </td>
          
            <td><div class="input-control text full-size" >
                    <select id="line">
                        
                    </select>
    </div> </td>
</tr>
<tr>
            <td>Schedule </td>
          
            <td><div class="input-control text full-size" >
                  <input type="text" id="sch" onkeypress='validate(event)' >  
    </div> </td>
</tr>
 <tr>
            <td>&nbsp;KW 1&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="kw1" value="0" onkeypress='validate(event)'>
</div>&nbsp;HPP &nbsp;<div class="input-control text small-size">
                    <input type="text" id="hpp1"  value="0" onkeypress='validate(event)'>
</div>&nbsp;Sell&nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell1"  value="0" onkeypress='validate(event)'>
</div>
            &nbsp;Qty&nbsp;<div class="input-control text small-size">
                    <input type="text" id="qty1" value="0" onkeypress='validate(event)'>
</div></td>
</tr>  
<tr>
            <td>&nbsp;KW 2&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="kw2"  value="0" onkeypress='validate(event)'>
</div>&nbsp;HPP &nbsp;<div class="input-control text small-size">
                    <input type="text" id="hpp2" value="0" onkeypress='validate(event)'>
</div>&nbsp;Sell&nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell2"  value="0" onkeypress='validate(event)'>
</div>
            &nbsp;Qty&nbsp;<div class="input-control text small-size">
                    <input type="text" id="qty2" value="0" onkeypress='validate(event)'>
</div></td>
</tr>   
 <tr>
            <td>&nbsp;KW 3&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="kw3"  value="0" onkeypress='validate(event)'>
</div>&nbsp;HPP &nbsp;<div class="input-control text small-size">
                    <input type="text" id="hpp3"  value="0" onkeypress='validate(event)'>
</div>&nbsp;Sell&nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell3" value="0" onkeypress='validate(event)'>
</div>
            &nbsp;Qty&nbsp;<div class="input-control text small-size">
                    <input type="text" id="qty3"  value="0" onkeypress='validate(event)'>
</div></td>
</tr>  
 <tr>
            <td>&nbsp;KW 4&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="kw4" value="0" onkeypress='validate(event)'>
</div>&nbsp;HPP &nbsp;<div class="input-control text small-size">
                    <input type="text" id="hpp4" value="0" onkeypress='validate(event)'>
</div>&nbsp;Sell&nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell4" value="0" onkeypress='validate(event)'>
</div>
            &nbsp;Qty&nbsp;<div class="input-control text small-size">
                    <input type="text" id="qty4" value="0" onkeypress='validate(event)'>
</div></td>
</tr>
 <tr>
            <td>&nbsp;KW 5&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="kw5" value="0" onkeypress='validate(event)'>
</div>&nbsp;HPP &nbsp;<div class="input-control text small-size">
                    <input type="text" id="hpp5" value="0" onkeypress='validate(event)'>
</div>&nbsp;Sell&nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell5"  value="0" onkeypress='validate(event)'>
</div>
            &nbsp;Qty&nbsp;<div class="input-control text small-size">
                    <input type="text" id="qty5" value="0" onkeypress='validate(event)'>
</div></td>
</tr>

           <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="saveCost()" id="save">SAVE</button></td>
</tr> 
     
       
    </table>
    </div>
<button class="button success" id="add">Add Price Cost</button>&nbsp; <button class="button warning" id="invoice" onclick="invoice()">View Selected</button>&nbsp; <button class="button primary" id="print">Report</button>&nbsp; <button class="button alert" id="remove">Remove</button>&nbsp; <button class="button alert" id="view">View</button>
 <table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
                        <thead>
                        <tr>
                            <th >No</th>
                            <th>DATE</th>
                            <th >ITEM NAME/CODE</th>
                            <th >LINE</th>
                            <th >SHEDULE</th>
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
