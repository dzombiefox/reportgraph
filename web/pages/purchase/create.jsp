<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script>
       function saveMotif(){
        var alus= "Sory motif name  can't empty";   
        var name=$("#motifName").val();
        if(name==""){
             $.Notify({                
                content: alus,
                type: 'alert'                
            });    
            $("#motifName").focus();
            
        }
        else{
        $.ajax({
            url:"purchase/saveMotif.jsp",
            data:"name="+name,
            success:function(){
            $("#motifName").val("");   
            $("#dialogMotif").dialog("close");   
                           var motif="";
     $.getJSON("purchase/getMotif.jsp",function(data){
         $.each(data,function(index,item) 
    {
      motif+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#motif").html(motif); 
      });
            }
        });
    }
        
    }
    function removeDetail(){
        var category=$("#category").val();
        var kode=$("#kode").val();
        $.ajax({
            url:"purchase/cekRow.jsp",
            data:"kode="+kode+"&detail="+category,
            success:function(data){
                var x=parseInt(data);
                if(x==1){
                    var retVal = confirm("Do you want to continue ?");
                    if( retVal == true ){
                    $.ajax({
                        url:"purchase/removeDetail.jsp",
                        data:"kode="+kode+"&detail="+category,
                        success:function(){
                            RefreshTable("#example","purchase/dataDetail.jsp?kode="+kode);
                            RefreshTable("#dexample","purchase/dataReceive.jsp?kode="+kode);
                        }
                        
                    });
               }
               else{
               
                  return false;
               }
                }
                else{
                    alert("Sory data not found ")
                }
            }
            
        });
        
    }
    function totalm2(){
        var qty=parseFloat($("#qty").val());
        var hasil=qty*1.44;
        if(isNaN(hasil)){
            $("#m2").val(0);
            
        }else{
        $("#m2").val(qty*1.44);
    }
    }
    function keyupResult(){
        var usd=parseFloat($("#usd").val());
        var rusd=parseFloat($("#rusd").val());
        var total=usd*rusd;
        $("#eidr").val(total);
    }
    function keyupIdr(){
        var idr=$("#idr").val();
        $("#eidr").val(idr);
    }
    function refresh(){
        var kode=$("#kode").val();
        $.ajax({
            url:"purchase/cek/cekQty.jsp",
            data:"kode="+kode,
            success:function(data){
                $("#qty").val(data)
            }
        });
         $.ajax({
            url:"purchase/cek/cekM2.jsp",
            data:"kode="+kode,
            success:function(data){
                $("#m2").val(data)
            }
        });
         $.ajax({
            url:"purchase/cek/cekKontainer.jsp",
            data:"kode="+kode,
            success:function(data){
                $("#kontainer").val(data)
            }
        });
         $.ajax({
            url:"purchase/cek/cekUsd.jsp",
            data:"kode="+kode,
            success:function(data){
                $("#us").val(data)
            }
        });
          $.ajax({
            url:"purchase/cek/cekKurs.jsp",
            data:"kode="+kode,
            success:function(data){
                $("#kurs").val(data)
            }
        });
        $.ajax({
            url:"purchase/cek/cekTanggal.jsp",
            data:"kode="+kode,
            success:function(data){
                var dat=data.replace(/\-/g, '.');
                $("#tanggal").val(dat);
            }
        });
        RefreshTable("#example","purchase/dataDetail.jsp?kode="+kode);
        RefreshTable("#dexample","purchase/dataReceive.jsp?kode="+kode);
        $("#save").attr("disabled","disabled")
    }
    function emptyFormDetail(){
        $("#idr").val("");
        $("#eidr").val("");
        $("#usd").val("");
        $("#rusd").val("");
        $("#estimasi").val("");
        $("#dialogFreight").dialog("close");
        
    }
    function saveDetail(){   
        var alwarn = "Sory data was found";
        var kode=$("#kode").val();
        var qty=$("#qty").val();
        var category=$("#category").val();
        var idr=$("#idr").val();
        var eidr=$("#eidr").val();
        var usd=$("#usd").val();
        var rusd=$("#rusd").val();
        var estimasi=$("#estimasi").val();
        var choose=$("#choose").val();
        var est=$('input:radio[name=est]:checked').val();
        $.ajax({
            url:"purchase/cekRow.jsp",
            data:"kode="+kode+"&detail="+category,
            success:function(data){
                var x=parseInt(data);
                if(x==1){
                    $.Notify({                
                content: alwarn,
                type: 'alert'
            }); 
                }
                else{
                    $.ajax({            
            data:"kode="+kode+"&category="+category+"&idr="+idr+"&eidr="+eidr+"&usd="+usd+"&rusd="+rusd+"&estimasi="+estimasi+"&qty="+qty+"&choose="+choose+"&est="+est,
            url:"purchase/saveDetail.jsp",
            success:function(data){
               RefreshTable("#example","purchase/dataDetail.jsp?kode="+kode); 
               RefreshTable("#dexample","purchase/dataReceive.jsp?kode="+kode); 
               emptyFormDetail();     
                $.ajax({
                url:"purchase/prosesReport.jsp",
                success:function(){
                    
                }
            });
                        }            
               });
                }}
             });
      }
    function newForm(){
        $("#us").val("");
        $("#m2").val("");
        $("#kurs").val("");
        $("#kode").focus();
        $("#kode").val("");
        $("#qty").val("");
        $("#tanggal").val("");
        $("#kontainer").val("");
        $("#motif").removeAttr("disabled");
        $("#kode").removeAttr("disabled");
        $("#qty").removeAttr("disabled");
        $("#tanggal").removeAttr("disabled");
        $("#kontainer").removeAttr("disabled");
        $("#m2").removeAttr("disabled");
        $("#us").removeAttr("disabled");
        $("#kurs").removeAttr("disabled");
        $("#save").removeAttr("disabled");
         RefreshTable("#example","purchase/dataDetail.jsp?kode="+0); 
         RefreshTable("#dexample","purchase/dataReceive.jsp?kode="+0); 
    }
    function disableForm(){
        $("#motif").attr("disabled","disabled");
        $("#kode").attr("disabled","disabled");
        $("#qty").attr("disabled","disabled");
        $("#tanggal").attr("disabled","disabled");
        $("#kontainer").attr("disabled","disabled");
        $("#m2").attr("disabled","disabled");
        $("#us").attr("disabled","disabled");
        $("#kurs").attr("disabled","disabled");
        $("#save").attr("disabled","disabled");
       
    }
    function savePurchase(){
         var alus= "Sory usd was found";
         var alkurs = "Sory kurs can't empty";
         var alwarning = "Sory code Purchase was found";
         var alkode = "Sory code purchase can't empty";
         var altanggal="Sory date can't empty";
         var alqty="Sory qty can't empty or zero";
         var alkontainer="Sory kontainer can't empty or zero";
         var alsukse="Success add new Purchase";
         var kode=$("#kode").val();
         var tanggal=$("#tanggal").val().replace(/\./g, '-');
         var qty=$("#qty").val();
         var kontainer=$("#kontainer").val();
         var us=$("#us").val();
         var m2=$("#m2").val();
         var kurs=$("#kurs").val();
         var motif=$("#motif").val();
         if(kode==""){
         $.Notify({                
                content: alkode,
                type: 'alert'                
            });    
            $("#kode").focus();
         }
         else if(tanggal==""){
             $.Notify({                
                content: altanggal,
                type: 'alert'
            }); 
            $("#tanggal").focus();
         }
         else if(qty=="" | qty<1){
             $.Notify({                
                content: alqty,
                type: 'alert'
            }); 
            $("#qty").focus();
         }
            else if(kontainer=="" | kontainer<1){
             $.Notify({                
                content: alkontainer,
                type: 'alert'
            }); 
            $("#kontainer").focus();
         }
            else if(us=="" | us<1){
             $.Notify({                
                content: alus,
                type: 'alert'
            }); 
            $("#us").focus();
         }
         else if(kurs=="" | kurs<1){
             $.Notify({                
                content: alkurs,
                type: 'alert'
            }); 
            $("#kurs").focus();
         }
       else{
           
            $.ajax({
            url:"purchase/cekPo.jsp",
            data:"kode="+kode,
            success:function(data){
                var x=parseInt(data);
                if(x==1){
                          $.Notify({                
                content: alwarning,
                type: 'alert'
            }); 
                   $("#kode").val("");
                }
                else{
                            
       $.ajax({
           data:"kode="+kode+"&tanggal="+tanggal+"&qty="+qty+"&kontainer="+kontainer+"&us="+us+"&m2="+m2+"&kurs="+kurs+"&motif="+motif,
           url:"purchase/save.jsp",
           success:function(data){
               $("#add").removeAttr("disabled");
               disableForm();
               $.Notify({                
                content: alsukse,
                type: 'success'                
            });
           
           }
           
       });
                }
              
            }
            
        });
   
   }
    }
    function empty(){
            $("#idr").val("");
            $("#eidr").val("");
            $("#usd").val("");
            $("#rusd").val("");
            $("#estimasi").val("");
    }
    function changeChoose(){
        empty();
        var choose=parseInt($("#choose").val());
        if(choose==0){
            $("#idr").attr("disabled","disabled");
            $("#eidr").attr("disabled","disabled");
            $("#usd").attr("disabled","disabled");
            $("#rusd").attr("disabled","disabled"); 
            
        }
        else if(choose==1){
            $("#usd").removeAttr("disabled");
            $("#rusd").removeAttr("disabled");  
            $("#idr").attr("disabled","disabled");
            $("#eidr").removeAttr("disabled");  
           // $("#eidr").attr("disabled","disabled");
        }
        else if(choose==2){
            $("#idr").removeAttr("disabled");
            $("#eidr").removeAttr("disabled");  
            $("#usd").attr("disabled","disabled");
            $("#rusd").attr("disabled","disabled");
        }
    } 

       $(document).ready(function(){
                  var motif="";
     $.getJSON("purchase/getMotif.jsp",function(data){
         $.each(data,function(index,item) 
    {
      motif+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#motif").html(motif); 
      });
         // $("#add").attr("disabled","disabled");
           disableForm();
           var kode=$("#kode").val();
           var detail=$("#category").val();
           var table=$("#example").dataTable({
            "bPaginate": false,
            "bInfo" : false,
            "bFilter": false,           
        "sPaginationType": "full_numbers",
        ajax: "purchase/dataDetail.jsp?kode="+kode
        });
        
          var dtable=$("#dexample").dataTable({
            "bPaginate": false,
            "bInfo" : false,
            "bFilter": false,           
        "sPaginationType": "full_numbers",
        ajax: "purchase/dataReceive.jsp?kode="+kode
        });
           $("#kode").focus();
           $("#idr").attr("disabled","disabled");
           $("#eidr").attr("disabled","disabled");
           $("#usd").attr("disabled","disabled");
           $("#rusd").attr("disabled","disabled"); 
           $("#m2").number( true );
           $("#kurs").number( true );
           $("#qty").number( true );
           $("#kontainer").number( true );
           $("#idr").number( true );
           $("#eidr").number( true );
           $("#usd").number( true );
           $("#rusd").number( true );
           $("#estimasi").number( true );
           $("#choose").change(function(){
           changeChoose();
           });
           
          $("#add").click(function(){
           var category=$("#category").val();
           var cat=parseInt(category);
           $("#dialogFreight").dialog("open");       
       });      
       $("#addMotif").click(function(){
        $("#dialogMotif").dialog("open");      
       });      
       if ($('#alert').is(":checked"))
{
  alert("ok");
}
    });
</script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Data Purchase</a></li>
    <li><a href="#">Create Purchase</a></li>
</ul>
                    <hr class="thin bg-grayLighter">
                    <div class="example" data-text="Form Create Purchase">
          

  


            

                        <table style="width: 100%" >
        <tr>
          <td >Motif Tile</td>
          <td ><div class="input-control select full-size"><select id="motif" ></select><button class="button" id="addMotif"><span class="mif-plus"></span></button></div></td>
          <td>&nbsp;</td>
          <td>Date Input</td>
          <td ><div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="tanggal">
        <button class="button"><span class="mif-calendar"></span></button>
    </div></td>
        </tr>
        <tr>
            <td >Code Purchase</td>
          
            <td ><div class="input-control text full-size">
              <input type="text" id="kode" />
          </div></td>
<td>&nbsp;</td>
<td>Container Received</td>
<td ><div class="input-control text medium-size">
        <input type="text" id="kontainer" maxlength="3" >
</div></td>
        </tr>
        
           <tr>
            <td>Qty Received</td>
          
            <td><div class="input-control text medium-size">
                    <input type="text" id="qty" onkeyup="totalm2()">
                </div> </td>
<td>&nbsp;</td>
<td>USD</td>
<td><div class="input-control text medium-size">
                    <input type="text" id="us">
</div></td>
        </tr>
        
   <tr>
            <td>M2</td>
          
            <td><div class="input-control text medium-size">
                    <input type="text" id="m2" readonly="readonly">
</div></td>
<td>&nbsp;</td>
<td>Kurs</td>
<td><div class="input-control text medium-size">
        <input type="text" id="kurs"  >
</div></td>
        </tr> 
           <tr>
            <td>&nbsp;</td>
          
            <td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><button class="button warning" onclick="newForm()">NEW INVOICE</button>&nbsp;<button class="button primary" onclick="savePurchase()" id="save">SAVE</button></td>
        </tr> 
     
       
    </table>
                        <!-- Dialog motif-->
       <div data-role="dialog" id="dialogMotif" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
                          <br />
                          
                          <table width="500px" >
  <tr>
    <td width="120">Motif Name</td>
    <td width="177">
    <div class="input-control text full-size">
      <input type="text" id="motifName" />
      </div>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="right">
        <input type="submit" value="save" id="saveMotif" onclick="saveMotif()" />
    </td>
  </tr>
</table>

                          
                          

               
      </div>                
  <!-- Dialog Ocean Fright-->
                        <div data-role="dialog" id="dialogFreight" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 600px">
                            <table style="width: 800px">
                                <tr>
                                    <th colspan="3">&nbsp;</th>
                                </tr>
                                <tr>
                                    <td>Choose Currency</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size">    
                                            <select id="choose">
                                                <option value="0">Choose</option>
                                            <option value="1">USD</option>
                                            <option value="2">IDR</option>
                                            </select></div>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>IDR</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size"><input type="text" id="idr" onkeyup="keyupIdr()"></div>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>USD</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size"><input type="text" id="usd" onkeyup="keyupResult()"></div>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>RATE USD</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size" ><input type="text" id="rusd" onkeyup="keyupResult()"></div>
                                    </td>
                                </tr> 
                                 <tr>
                                    <td>EQF IDR</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size"><input type="text" id="eidr"></div>
                                    </td>
                                </tr> 
                                <tr>
                                    <td>ESTIMATION</td>
                                    <td>:</td>
                                    <td><div class="input-control text full-size"><input type="text" id="estimasi"></div>
                                    </td>
                                </tr> 
                                <tr>
                                  <td height="37"></td>
                                  <td></td>
                                  <td>
                                      <label class="input-control radio">
                                          <input type="radio" name="est" checked id="est" value="1">
                            <span class="check"></span>
                            <span class="caption">Real Estimation</span>
                        </label><br>
                        <label class="input-control radio">
                            <input type="radio" name="est" id="est" value="0">
                            <span class="check"></span>
                            <span class="caption">Fake Estimation</span>
                        </label>
                                  </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <button class="button"  onclick="saveDetail()"><span class="mif-database"></span> Save Data</button>
                                        
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                        <hr>
                         <div class="input-control select meduim-size">
        <select id="category"  >
            <% connect c=new connect();
            String q="select * from category";
            ResultSet rs=c.GetData(q);
            while(rs.next()){
            out.print("<option value='"+rs.getString("category_id")+"'>"+rs.getString("category_name")+"</option>");
            }
            %>
        </select>
                         </div>   <button class="button" onClick="showDialog()" id="add" title="tes"><span class="mif-checkmark"></span> Add Performe Invoice</button>&nbsp;<input type="submit" id="view" value="View Data" onclick="refresh()">&nbsp;<input type="submit" id="view" value="Remove Performa Invoice" onclick="removeDetail()">
                       <fieldset>
    <legend>Detail Data </legend>  
                        <table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
                        <thead>
                        <tr>
                            <td style="width: 200px">
                                No Performa Invoice
                            </td>
                            <td style="width: 100px">USD</td>
                            <td style="width: 100px">IDR</td>
                            <td style="width: 100px">RATE USD</td>
                            <td style="width: 100px">EQV IDR</td>
                            <td style="width: 100px">ESTIMATION</td>
                            <td style="width: 100px"></td>
                        </tr>
                        </thead>
                        <tbody id="detailBeli">
                        
                        
                        </tbody>
                    </table>
                        </fieldset> 
                         <hr>
                             <fieldset>
    <legend>Detail receive Item </legend>  
                        <table class="condensed border bordered dataTable"  data-auto-width="false" id="dexample">
                        <thead>
                        <tr>
                            <td style="width: 200px">
                                No Performa Invoice
                            </td>
                            <td style="width: 100px">USD</td>
                            <td style="width: 100px">IDR</td>
                            <td style="width: 100px">RATE USD</td>
                            <td style="width: 100px">EQV IDR</td>
                            <td style="width: 100px">ESTIMATION</td>
                            <td style="width: 100px"></td>
                        </tr>
                        </thead>
                        <tbody>
                        
                        
                        </tbody>
                    </table>
                        </fieldset> 
                </div>
                
       

