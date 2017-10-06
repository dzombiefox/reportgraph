<%@page import="config.connect"%>
<%@page import="java.sql.ResultSet"%>
<style>

.datagrid input{
    border: none;
}

.datagrid {
         
          background: #fff; overflow: hidden; -webkit-border-radius: 3px;
          -moz-border-radius: 3px; 
          border-radius: 3px;
}
.datagrid table td, 
.datagrid table th { padding: 0px 1px;
 border: 1px solid graytext;
 }

 
.datagrid table tr { 
height:27px;

 }


.datagrid table tbody td {  

font-size: 14px;font-weight: normal;

}



dow_active, 
div.dhx_modal_cover_dv { position: fixed !important; }
</style>
<script>
  
    function batasiAngka(angka,digit){
    return angka.toFixed(digit);
    }
    
    function kosong(){
        $("#name").val("");
        $("#water").val("");
        $("#totalPrice").val("");
        $("#totalVolume").val("");
        $("#average").val("");     
        $("#weight").val("");
     
    }
    
    function choose(){        
        kosong();
           var cData=[];
           $('.cData:checked').each(function(){
           cData.push($(this).val());
        });
        $("#jml").val(cData.length);
         for (var i = 0; i <cData.length; i += 1) {
             var data=cData[i];
             var split=data.split("/");
             var id=split[0];
             var code=split[1];
             var price=split[2];
             var volume=split[3];   
            // $("#itemsTable tbody").append("<tr class='item-row'><td style='padding-top:5px'><input type='text' name='id_0' id='id_0' class='id_0 span12'   readonly style='width: 100%' ></td><td style='padding-top:5px'><input type='text' name='code_0' id='code_0' class='0 span12'   readonly style='width: 100%' onclick='getData(this)'></td><td style='padding-top:5px'><input type='text' name='maks_0' id='maks_0' class='maks_0 span12'   readonly style='width: 100%' value='0' ></td><td style='padding-top:5px'><input type='text' name='wet_0' id='wet_0' class='wet_0 span12'   readonly style='width: 100%' value='0'></td><td style='padding-top:5px'><input type='text' name='dry_0' id='dry_0' class='dry_0 span12'   readonly style='width: 100%' value='0'></td><td style='padding-top:5px'><input type='text' name='volume_0' id='volume_0' class='volume_0 span12'  style='width: 100%' value='0' onblur='amountWet(this);amountPrice(this);totalHarga(this);totalVol(this);totalAverage(this);'></td><td style='padding-top:5px'><input type='text' name='harga_0' id='harga_0' class='harga_0 span12'  readonly style='width: 100%' value='0'></td></tr>");         

             
             $("#itemsTable tbody").append("<tr ><td ><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 40px' value="+id+"></td><td ><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+code+"></td><td ><input type='text' name='maks_"+i+"' id='maks_"+i+"' class='maks_"+i+" span12'   readonly style='width: 100%' value="+volume+"></td><td ><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+price+"><td  ><input type='text' name='dry_"+i+"' id='dry_"+i+"' class='span12'  readonly='readonly' value='0' required ></td></td><td ><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12'    style='width: 100%' onblur='amountWet(this);amountPrice(this);totalHarga(this);totalVol(this);totalAverage(this);' value='0'></td><td ><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%' ></td></tr>");
             $("#volume_0").focus();
         }
         $("#dialogAdd").dialog("close");
         $('input:checkbox').removeAttr('checked');
    }
    
     
    
     function clearData(){
         kosong();
         $("#itemsTable  tbody").html("");
          
     }

    function weightPcs(){        
          var size=$("#size").val();          
          $.ajax({
              type:"POST",
              url:"body/getWeight.jsp",
              data:"size="+size,
              success:function(data){
              var x= parseFloat(data);
              if(x==0){
                  alert("value not found");
                  $("#weight").val(0)
                 }
                 else{
                     $("#weight").val(data)
                 }
            
               
              }
              
          })
    }
     
    function amountWet(tmpObj){
          var persen=100;
          var strNama=tmpObj.name;
          var x=strNama.split("_")[1];
          var wet = document.getElementsByName('wet_'+x)[0].value;
          var maks = document.getElementsByName('maks_'+x)[0].value;
          var c=(persen-maks)/persen;         
         if(maks==100){
             document.getElementsByName('dry_'+x)[0].value =wet; 
              }
          
         else{
          document.getElementsByName('dry_'+x)[0].value = batasiAngka(parseFloat(wet)/parseFloat(c),2);
         }
      }
        function totalHarga(tmpObj){
        var tmpTotal = 0;
	var tmpAngka = 0;
        var jml = document.getElementsByName('jml')[0].value;
        for(var x=0; x <jml; x++) {
		tmpAngka = document.getElementsByName("harga_"+x)[0].value;
		tmpTotal = parseFloat(tmpTotal) + parseFloat(tmpAngka);
		
	}
        var tot=batasiAngka(tmpTotal,2);
        if(isNaN(tot)){
            $("#totalPrice").val(0);
            
        }else{
	$("#totalPrice").val(tot);
    }
      }
      
           function totalVol(tmpObject){
     var tmpTotal = 0;
	var tmpAngka = 0;
	var jum = $("#jml").val();
	for(var x=0; x <jum; x++) {
		tmpAngka = document.getElementsByName("volume_"+x)[0].value;
		tmpTotal = parseFloat(tmpTotal) + parseFloat(tmpAngka);
		
	}
        if(isNaN(tmpTotal)){
           $("#totalVolume").val(0);
         
        }
        else{
	$("#totalVolume").val(tmpTotal);
    }
      }
     
  function amountPrice(tmpObj){
          var persen=100;
          var strNama=tmpObj.name;
          var x=strNama.split("_")[1];
          var dry = document.getElementsByName('dry_'+x)[0].value;
          var volume = document.getElementsByName('volume_'+x)[0].value;
          var tot=batasiAngka(parseFloat(dry*volume)/parseFloat(persen),2);
          if(isNaN(tot)){
              document.getElementsByName('harga_'+x)[0].value=0;              
          }
          else{
          document.getElementsByName('harga_'+x)[0].value = tot;
      }
  }
    function totalAverage(tmpObj){
         
         var price=$("#totalPrice").val();
            var volume=$("#totalVolume").val();
            var avg=price*100/volume;
            if(isNaN(avg)){
             $("#average").val(0);   
                
            }
            else{
            $("#average").val(batasiAngka(avg,2));
     }
 }
    
    function getData(tmpObject) {
        var left = (screen.width/2)-(450/2);
        var top = (screen.height/2)-(450/2);
	var strNama = tmpObject.name;
	var x = strNama.split("_")[1];
	window.open('data/getBody.jsp?var=' + strNama , 'getData', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+700+', height='+500+', top='+top+', left='+left);

}
    $(document).ready(function(){
        $("#pilihan").change(function(){
         
            var pilihan=parseInt($("#pilihan").val());
            if(pilihan==0){
            disableWater()
        }
        else{
            enableWater();
        }
        });
        $("#example").dataTable({
            "bPaginate":false,
        });
        $("#go").click(function(){
            $("#itemsTable tbody tr").remove(); 
            var cari=$("#cari").val();
             $.ajax({
               url:"body/go.jsp",
               data:"cari="+cari,
               success:function(data){         
var obj = JSON.parse(data);
var length = Object.keys(obj).length;
$("#jml").val(length);
       for(i=0;i<length;i++){
           var idNya=obj[i].id; 
           var codeNya=obj[i].code;
           var maxVolume=obj[i].maxVolume;
           var priceWet=obj[i].priceWet;
           var priceDry=obj[i].priceDry;
           var volume=obj[i].volume;
           var total=obj[i].total;
           var uprecent=obj[i].uprecent;
//$("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+idNya+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+codeNya+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+priceNya+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12' value="+volumeNya+"    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this);' ></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%'  value="+totalNya+"></td></tr>");         
  $("#itemsTable tbody").append("<tr class='item-row'><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+idNya+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+codeNya+"></td><td style='padding-top:5px'><input type='text' name='maks_"+i+"' id='maks_"+i+"' class='maks_"+i+" span12'   readonly style='width: 100%' value="+maxVolume+" ></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+priceWet+"></td><td style='padding-top:5px'><input type='text' name='dry_"+i+"' id='dry_"+i+"' class='dry_"+i+" span12'   readonly style='width: 100%' value="+priceDry+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12'  style='width: 100%' value="+volume+" onblur='amountWet(this);amountPrice(this);totalHarga(this);totalVol(this);totalAverage(this);'></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'  readonly style='width: 100%' value="+total+"></td></tr>");         
          kosong();
            $("#volume_0").focus();
       }
       
               }
               
           });
            
        });
        
        
                  var periode,ro;
       $.getJSON("jsonData/jsonWater.jsp",function(data){
        $.each(data,function(index,item) 
        {
         ro+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $("#ro").html(ro); 
    });
        $.getJSON("jsonData/jsonPeriode.jsp",function(data){
       periode+="<option value='0' selected='selected'>Choose Periode</option>";
        $.each(data,function(index,item) 
        {
         periode+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $(".periode").html(periode); 
    });
 $("#simpan").click(function(){
                var x="";
                var avolume="volume can't empty or zero !!";
                var asuccess= "Success Add formula";  
                var aname= "Body Name  Can't empty";  
                var awater= "Volume Water Can't empty";  
                var asize= "Size Not Found";  
                var name=$("#name").val();
                var body=$("#body").val();
                var ro=$("#ro").val();
                var water=$("#water").val();
                var weight=$("#weight").val(); 
                var amountPrice=$("#totalPrice").val();
                var amountVolume=$("#totalVolume").val();
                var average=$("#average").val();
                var size=$("#size").val();                 
                var per=$("#periode").val();           
        if(name==""){
           $.Notify({                
                content: aname,
                type: 'alert'                
            });    
            $("#name").focus();            
        }    
        else if(water==""){
           $.Notify({                
                content: awater,
                type: 'alert'                
            });    
            $("#water").focus();            
        }  
        else if(weight==0){
           $.Notify({                
                content: asize,
                type: 'alert'                
            });    
            $("#weight").focus();            
        } 
        else{            
            var keluar = {"name":"","body":"","ro":"","water":"","amountPrice": "", "amountVolume": "", "average":"" ,"size":"","periode":"","weight":"","row":"", "details": []};
            var detail={ "id": "", "maks": "", "wet": "","dry":"","volume":"","harga":"" };
            var jml=$("#jml").val();    
            keluar.name=name;
            keluar.body=body;
            keluar.amountPrice=amountPrice;
            keluar.amountVolume=amountVolume;
            keluar.average=average;
            keluar.size=size;
            keluar.periode=per;
            keluar.weight=weight;         
            keluar.row=jml;           
            keluar.ro=ro;
            keluar.water=water;
             
            for(i=0;i<=jml-1;i++){
                var id=$("#id_"+i).val();
                var maks=$("#maks_"+i).val();
                var wet=$("#wet_"+i).val();
                var dry=$("#dry_"+i).val();
                var volume=$("#volume_"+i).val();
                var harga=$("#harga_"+i).val();
                detail.id=id;
                detail.maks=maks;
                detail.wet=wet;
                detail.dry=dry;
                detail.volume=volume;
                detail.harga=harga;
                if(volume==""||volume=="0"){
                $.Notify({                
                content: avolume,
                type: 'alert'                
                });    
                $("#volume_"+i).focus();
                x=0;
                }
                
                keluar.details.push(detail);
                var detail={ "id": "", "maks": "", "wet": "","dry":"","volume":"","harga":"" };                    
                      
        } 
        if(x=="0"){
            
            
        }
        else{
            x=1;
             $.Notify({                
                content: asuccess,
                type: 'alert'                
              }); 
                var json = JSON.stringify(keluar);                
                $("#totalPrice").val("");
                $("#totalVolume").val("");
                $("#average").val("");
                $("#weight").val("");             
                clearData();
                  for(i=0;i<=jml-1;i++){
                     $("#id_"+i).val("");                           
                     $("#code_"+i).val("");
                     $("#wet_"+i).val("");
                     $("#volume_"+i).val("");
                     $("#harga_"+i).val("");
                     $("#maks_"+i).val("");
                    $("#dry_"+i).val("");                                          
                   $("#name").val("");                      } 
                $.ajax({
         url:"body/save.jsp",
         data: {data:json},
         success: function(data) {
             
            }
        
          
      });
  }
                                         
    }
            
        });
        
        $("#itemsTable").dataTable({          
            "scrollCollapse": true,
            "bPaginate":false,
            "bLengthChange": false,
            "bFilter": false,
            "bSort": false,
	    "bInfo":false,
        });
  var per="";  
    $.getJSON("jsonData/jsonPeriode.jsp",function(data){
      
  $.each(data,function(index,item) 
    {
      per+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#periode").html(per); 
       
  });
  var items="";
  $.getJSON("jsonData/jsonSize.jsp",function(data){
      
  $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#size").html(items); 
       
  });
  
  
         $("#per").change(function(){
             clearData();
          var per=$("#per").val();
          var comboBody="";
          $.getJSON("body/getBody.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Body</option>";
          $.each(data,function(index,item) 
          {
          comboBody+="<option value='"+item.id+"'>"+item.name+"&nbsp;"+item.size+"</option>";
          });
          $("#cari").html(comboBody);        
          });
         
          });
      $("#size").change(function(){
        weightPcs();
        
      });
         
     
         $('.open-dialog').click(function() {
                clearData();
                $("#edit").hide();
                $("#save").show();
               
		$("#dialogAdd").dialog("open");
                return false;
	});
    });
</script>
<div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px;height:300px;">
 <br>
 <div style="overflow-y: scroll;height: 400px">
 
                    <table id="example" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered  table-condensed" style="width: 95%">
						<thead>
							<tr>
                                                         
								<th>NO</th>

<th>ID</th>
<th>CODE</th>
<th>Name</th>
<th>DESC</th>
<th>UPRECENT</th>
<th>VOLUME</th>
<th>COLOR</th>
<th>&nbsp;</th>

						</tr>
						</thead>
						
                                                
                                                <tbody>
                                                    <%
                                                int no=1;
                                                 connect c=new connect();
    String q="select * from items order by items_id desc";
    ResultSet rs=c.GetData(q);
    while(rs.next()){
        String idItems=rs.getString("items_id");
        String kodeItems=rs.getString("items_Code");
        String upRecent=rs.getString("items_uprecent");
        String volume=rs.getString("items_volume");
        String kodeNya=idItems+"/"+kodeItems+"/"+upRecent+"/"+volume;
                                                %>
                                                <tr class="gradeX">
<td><% out.print(no); %>1</td>

<td><% out.print(rs.getString("items_id")); %>sdsd</td>
<td><% out.print(rs.getString("items_code")); %></td>
<td><% out.print(rs.getString("items_name")); %></td>
<td><% out.print(rs.getString("items_desc")); %></td>                                  
<td><% out.print(rs.getString("items_uprecent")); %></td>
<td><% out.print(rs.getString("items_volume")); %></td>
<td><% out.print(rs.getString("items_color")); %></td>




<td> <input type="checkbox" name="categories" value='<% out.print(kodeNya); %>'  class="cData" ></td>

                                                </tr>                     
                                                
                        <%
     no++;}
                       
                        %>                        
							
							
							
						</tbody>
						
					</table>

 </div>
         <div class="button-wrapper" >
             <button  id="choose" class="button primary save" style="float: right" onclick="choose()">Choose</button> 
                            
         </div>	 
	</div>					
                         <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Body</a></li>
    <li><a href="#">Create Body</a></li>
</ul>
 <hr class="thin bg-grayLighter">					
<div class="example" data-text="formula Body">				
			

    <br>
    <table width="100%">
        <tr>
            <td width="125px">
             <a href="#" class="open-dialog button alert"> Search Data</a>   
            </td>
            <td width="120px">
               <button class="new button success" onclick="clearData()">Clear data</button>  
            </td>
            <td>
                <div class="input-control select full-size"><select class="periode" id="per" style="max-width: 200px;"></select> </div> 
            </td>
            <td width="300px">&nbsp;</td>
            <td>
                <div class="input-control select full-size"><select id="cari" style="min-width: 200px"></select>  <button id="go" class="button"><span class="mif-looks"></span></button>  </div>
            </td>
            
        </tr>
    </table>
    <div class="datagrid">
   <fieldset>
    <legend>Formula Body </legend> 
    <table id="itemsTable" style="width: 100%" class="table-bordered table table-condensed" border="1">
<thead>
<tr style="height: 40px">
<td style="width:5%"  >&nbsp;&nbsp;&nbsp;ID</td>
<td >&nbsp;&nbsp;&nbsp;ITEM CODE</td>
<td style="width: 100px">&nbsp;&nbsp;&nbsp;MAX H20</td>
<td >&nbsp;&nbsp;&nbsp;PRICE WET</td>
<td >&nbsp;&nbsp;&nbsp;PRICE DRY</td>
<td style="width: 100px">&nbsp;&nbsp;&nbsp;VOLUME</td>
<td  style="width: 200px">&nbsp;&nbsp;&nbsp;RP</td>
</tr>
</thead>
<tbody>    
</tbody>
</table>
    <p>
        <select id="ro" style="width: 200px;height: 30px">
            
        </select> Volume Water : <input type="text" id="water" style="border: 1px solid #D9D9D9;height: 30px;padding-left: 5px"/>
    </p>
</fieldset>  
<input type="hidden" name="jml"  id="jml"  value='1'>
</div>
<br>
<input type="hidden" class=" span12"  id="totalPrice" />
<input type="hidden" class=" span12"  id="totalVolume" />
<input type="hidden" class=" span12" id="average"  />
   <div class="col-lg-6 left ">

   </div>



    <table  id="konten"  style="width: 100%; padding: 10px"  >
     <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Body Name</td>
                 
                      <td style="width: 20%">   <div class="input-control text full-size"><input type="text" class="name" name="name" id="name"   style="width: 100%"></div></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td align="left"  style="width: 20%"><span class="header_tabel" style="width: 20%">Choose Size</span></td>
                             
                  <td><div class="input-control text full-size"><select name="size" id="size" style="width: 100%">
                              </select></div></td>
        </tr>
      <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Body Choose</td>
                 
                      <td style="width: 20%"><div class="input-control text full-size"><select id="body">
                                  <option>Normal</option>
                                  <option>Thin</option>
                              </select></div></td>
                      <td style="width: 8%">&nbsp;</td>
                  <td align="left"  style="width: 20%">Weight/Pcs</td>
                             
                  <td><div class="input-control text full-size"><input type="text" class="weight span11" name="weight" id="weight" readonly="readonly" required="required" style="width: 100%"  /></div></td>
        </tr>
                         
            <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Periode</td>
                 
                      <td style="width: 20%"><div class="input-control text full-size"><select name="periode" id="periode" style="width: 100%">
                              </select></div></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td align="left"  style="width: 20%">&nbsp;</td>
                             
                  <td style="width: 20%"><button class="button primary" type="button" id="simpan"> Save Formula</button></td>
        </tr>   
                  
                  
                  
                   
                  
                   
                
              </table>

 
</div>