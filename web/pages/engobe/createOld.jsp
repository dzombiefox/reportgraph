<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
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
font-size: 14px;font-weightwe: normal;

}
dow_active, 
div.dhx_modal_cover_dv { position: fixed !important; }
</style>
<script> 
    function choose(){
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
           
             $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+id+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+code+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+price+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12'    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this);' value='0'></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%' ></td></tr>");
             
         }
         $("#volume_0").focus();
              $("#dialogAdd").dialog("close");
              $('input:checkbox').removeAttr('checked'); 
        
    }
    function clearData(){
         $("#itemsTable  tbody").html("");
         $("#name").val("");
         $("#totalPrice").val("");
         $("#average").val("");
         $("#totalVolume").val("");
         $("#weightwet").val("");
        
        
    }
        $(function(){
        $('.open-dialog').click(function() {
                clearData();
                $("#edit").hide();
                $("#save").show();               
		$("#dialogAdd").dialog("open");
                return false;
	});
	
    });
       function getData(tmpObject) {
	var strNama = tmpObject.name;
	var x = strNama.split("_")[1];
	window.open('data/getEngobe.jsp?var=' + strNama ,'getData','addressbar=0,location=0,height=650,width=1200,scrollbars=1');

}
    function batasiAngka(angka,digit){
    return angka.toFixed(digit);
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
        }
        else{
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
        }else{
	$("#totalVolume").val(tmpTotal);
    }
      }
      function amountPrice(tmpObj){
          var persen=100;
          var strNama=tmpObj.name;
          var x=strNama.split("_")[1];
          var volume = document.getElementsByName('volume_'+x)[0].value;
          var wet = document.getElementsByName('wet_'+x)[0].value;
          var tot=batasiAngka(parseFloat(volume/persen)*parseFloat(wet),2);
          if(isNaN(tot)){
           document.getElementsByName('harga_'+x)[0].value = 0;   
          }else{
          document.getElementsByName('harga_'+x)[0].value =tot; 
      }
  }
     function totalAverage(tmpObj){
         
         var price=$("#totalPrice").val();
            var volume=$("#totalVolume").val();
            var avg=(price*100)/volume;
            if(isNaN(avg)){
                $("#average").val(0);               
            }else{
            $("#average").val(batasiAngka(avg,2));
     }
 }
      $(document).ready(function(){ 
          $("#example").dataTable({
            "bPaginate":false,
        });
          var items="";
          var periode="";  
          var color="";
            $.getJSON("jsonData/jsonSize.jsp",function(data){
      
  $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#size").html(items); 
       
  });
        $.getJSON("jsonData/jsonPeriode.jsp",function(data){
      //  periode+="<option value='0' selected='selected'>Choose Periode</option>";
        $.each(data,function(index,item) 
        {
         periode+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $(".periode").html(periode); 
    });
      $.getJSON("jsonData/jsonColor.jsp",function(data){
      color+="<option value='0'></option>";
  $.each(data,function(index,item) 
    {
     color+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#color").html(color); 
       
  }); 
     
     $("#size").change(function(){
              var size=$("#size").val();
              $.ajax({
              data:"size="+size,
              url:"engobe/wetWeight.jsp",
              success:function(data){
             $("#weightwet").val(data); 
           
              }
              
          });
            
        });
          $("#go").click(function(){
           clearData();   
           var cari=$("#cari").val();
           $.ajax({
               url:"engobe/go.jsp",
               data:"cari="+cari,
               success:function(data){         
var obj = JSON.parse(data);
var length = Object.keys(obj).length;
$("#jml").val(length);
       for(i=0;i<length;i++){
           var idNya=obj[i].id; 
           var codeNya=obj[i].code;
           var priceNya=obj[i].price;
           var volumeNya=parseFloat(obj[i].volume);
           var totalNya=obj[i].total;
  $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+idNya+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+codeNya+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+priceNya+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12' value="+volumeNya+"    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this);costDry()' ></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%'  value="+totalNya+"></td></tr>");         
           
       }
       $("#volume_0").focus();
       
               }
               
           })
      
       });
        
         $("#per").change(function(){
          var per=$("#per").val();
          clearData();
          var comboBody="";
          $.getJSON("engobe/getEngobe.jsp?per="+per,function(data){  
          comboBody+="<option >Choose Engobe</option>";
          $.each(data,function(index,item) 
          {
          comboBody+="<option value='"+item.id+"'>"+item.name+"&nbsp;"+item.color+"</option>";
          });
          $("#cari").html(comboBody);        
          });
          });
        $("#simpan").click(function(){
          var x="";
          var avolume="volume can't empty";
          var aname="name can't empty";
          var aweight="weight wet can't empty";
              var name=$("#name").val();
              var color=$("#color").val();
              var per=$("#periode").val();    
              var totalPrice=$("#totalPrice").val();
              var weight=$("#weightwet").val();
              var average=$("#average").val();
              var totalVolume=$("#totalVolume").val();
              var size=$("#size").val();
              var row=$("#jml").val();
              
            if(name==""){
            $.Notify({                
                content: aname,
                type: 'alert'                
                });    
                $("#name").focus();
          }
          else if(weight==""){
             $.Notify({                
                content: aweight,
                type: 'alert'                
                });    
                $("#weightwet").focus(); 
              
          }else{  
              var keluar = { "name": "","color":"", "totalPrice": "", "weight":"","periode":"" ,"average":"","totalVolume":"","size":"","row":"", "details": []};
              var detail={ "id": "", "wet": "", "volume": "","harga":"" };
              keluar.name=name; 
              keluar.color=color;
              keluar.totalPrice=totalPrice;
              keluar.weight=weight;
              keluar.periode=per;
              keluar.average=average;
              keluar.totalVolume=totalVolume;
              keluar.size=size;
              keluar.row=row;
             for(i=0;i<=row-1;i++){
             var id=$("#id_"+i).val();
             var wet=$("#wet_"+i).val();
             var volume=$("#volume_"+i).val();
             var harga=$("#harga_"+i).val(); 
             detail.id=id;
             detail.wet=wet;
             detail.volume=volume;
             detail.harga=harga;
             keluar.details.push(detail);
             detail={ "id": "", "wet": "", "volume": "","harga":"" };
               if(volume==""||volume=="0"){
                $.Notify({                
                content: avolume,
                type: 'alert'                
                });    
                $("#volume_"+i).focus();
                x=0;
                }
             }
              if(x=="0"){}
              else{
              var json = JSON.stringify(keluar);            
              clearData();
             
            $.ajax({
                url:"engobe/save.jsp",
                data:{data:json},
                success:function(data){
                    
                }
            });
        }
        }
        
     })
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
    <li><a href="#">Engobe</a></li>
    <li><a href="#">Create Engobe</a></li>
</ul>  
<hr class="thin bg-grayLighter">   
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

 <div class="example" data-text="formula Engobe">	
      <br>
       <div class="datagrid">
       <fieldset>
    <legend>Formula Engobe </legend> 
<table id="itemsTable" style="width: 100%" class="table-bordered table table-condensed" border="1">
<thead>
   <tr style="height: 40px">
       <th style="width: 5%" >&nbsp;&nbsp;&nbsp;ID</th>
<th>&nbsp;&nbsp;&nbsp;ITEM CODE</th>
<th>&nbsp;&nbsp;&nbsp;PRICE</th>
<th>&nbsp;&nbsp;&nbsp;VOLUME %</th>
<th>&nbsp;&nbsp;&nbsp;RP</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
    <!-- hidden value -->
<input type="hidden" class="span11" name="totalPrice" id="totalPrice" >
<input type="hidden" class="average span11" name="average" id="average" >
<input type="hidden" class="span11" name="totalVolume" id="totalVolume" >
    </fieldset>
       </div>
<input type="hidden" name="jml"  id="jml" value="1" >
<br>
<table  style="width: 100%" class="table-condensed">
                    <tr>
                      <td >Engobe Name</td>
                      
                      <td>
                          <div class="input-control text full-size">
                              <input type="text" id="name" />
                          </div>
					  </td>
                                          <td>&nbsp;</td>
                                          
                      <td>Size</td>
                      
                      <td>
                            <div class="input-control text full-size">
                          <select id="size"></select>
                            </div>
					  </td>                      
                  </tr>  
                  <tr>
                      <td >Periode</td>
                      
                      <td>
                         <div class="input-control text full-size"><select id="periode"  class="periode">
                              
                             </select></div>
					  </td>
                                          <td>&nbsp;</td>
                                          <td>WEIGHT (WET) G/P </td>
                     
                      <td>
                        <div class="input-control text full-size"> <input type="text" class="weightwet span11" id="weightwet" name="weightwet" readonly style="width: 100%"  ></div>
                            
					  </td>
                  </tr>
                   
                  <tr>
                      <td >Color</td>
                    
                      <td>   
                            <div class="input-control text full-size">
                              <select id="color"  style="width:100%"></select>
                           </div>
                                
                            </td>
                              <td>&nbsp;</td>
                              <td ></td>
                 
                      <td>  
                                      
                       <button class="button primary" type="button" id="simpan">  Save Formula</button>
                            </td>
                  </tr>
                 
                  
                  
              </table>
</div>
  