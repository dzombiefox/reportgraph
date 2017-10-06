<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
 <style>
   input   {
    padding-left: 3px;
}
 #konten td { 
    padding: 5px;
}
  </style>
<script>
    function clearData(){
         $("#itemsTable  tbody").html("");
         $("#name").val("");
         $("#totalPrice").val("");
         $("#average").val("");
         $("#totalVolume").val("");
         $("#weightwet").val("");
         $("#weightdry").val("");
         $("#costdry").val("");
    }
    
    $(function(){
        $('.open-dialog').click(function() {
                clearData();
                $("#edit").hide();
                $("#save").show();
                $("#judul").html("Tambah Items Engobe");    
		$('#kotak-dialog2').show();
		$('#dialog-overlay').fadeTo("normal", 0.4);
                return false;
	});
	$('#kotak-dialog2 .tutup').click(function() {
           	$('#dialog-overlay, #kotak-dialog2').hide();                
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
          
    function amountWet(tmpObj){
          var persen=100;
          var strNama=tmpObj.name;
          var x=strNama.split("_")[1];
          var wet = document.getElementsByName('uprecent_'+x)[0].value;
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
         var avg=(price*100)/volume;
         if(isNaN(avg)){
            $("#average").val(0);               
            }else{
            $("#average").val(batasiAngka(avg,2));
                 }
          }
$(document).ready(function(){   
          $("#per").change(function(){
          var per=$("#per").val();
          clearData();
          var comboBody="";
          $.getJSON("body/comboBody.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Body</option>";
          $.each(data,function(index,item) 
          {
          comboBody+="<option value='"+item.id+"'>"+item.name+"&nbsp;"+item.size+"</option>";
          });
          $("#cari").html(comboBody);        
          });
          });
          
          $("#size").change(function(){
          var size=$("#size").val();          
          $.ajax({
              type:"POST",
              url:"body/getWeight.jsp",
              data:"size="+size,
               success:function(data){
               $("#weight").val(data);  
               $("#weightdry").val("");
               $("#costdry").val("");
              }              
          });          
      });
          var motiv="";
          var color="";
          $.getJSON("data/jsonMotiv.jsp",function(data){
          motiv+="<option selected='selected'>Choose Motif</option>";
          $.each(data,function(index,item) 
          {
            motiv+="<option value='"+item.id+"'>"+item.name+"</option>";
          });
          $("#motiv").html(motiv);        
      });
      $.getJSON("data/getColor.jsp",function(data){
      color+="<option value='0'></option>";
      $.each(data,function(index,item) 
      {
       color+="<option value='"+item.id+"'>"+item.name+"</option>";
      });
      $("#color").html(color);
      }); 
 
      $("#cari").change(function(){
            clearData();
      });
      $("#go").click(function(){
           clearData();   
           var cari=$("#cari").val();
          
           $.ajax({
               url:"body/go.jsp",
               data:"cari="+cari,
               success:function(data){         
           var obj = JSON.parse(data);
           var length = Object.keys(obj).length;
       $("#jml").val(length);
       for(var i=0;i<length;i++){
           var idNya=obj[i].id; 
           var codeNya=obj[i].code;
           var maxVolume=obj[i].maxVolume;
           var priceWet=obj[i].priceWet;
           var priceDry=obj[i].priceDry;
           var volumeNya=parseFloat(obj[i].volume);
           var totalNya=obj[i].total;
           var uprecent=obj[i].uprecent;
        $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+idNya+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+codeNya+"></td><td style='padding-top:5px'><input type='text' name='maks_"+i+"' id='maks_"+i+"' class='maks_"+i+" span12'   readonly style='width: 100%' value="+maxVolume+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+priceWet+"></td><td style='padding-top:5px'><input type='text' name='uprecent_"+i+"' id='uprecent_"+i+"' class='uprecent_"+i+" span12'   readonly style='width: 100%' value="+uprecent+"></td><td style='padding-top:5px'><input type='text' name='dry_"+i+"' id='dry_"+i+"' class='dry_"+i+" span12'   readonly style='width: 100%' value="+priceDry+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12' value="+volumeNya+"    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this)' ></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%'  value="+totalNya+"></td></tr>");         
        }
        }      
           });
           $.ajax({
               url:"body/head.jsp",
               data:"cari="+cari,
               success:function(data){
               var m = eval(data);
               for (var i = 0; i < 1; i++) {  
               var detailId=m[i].detailId; 
               var id=m[i].id;
               var name=  m[i].name ;
               var totalPrice=m[i].amountPrice; 
               var weightPcs=m[i].weightPcs;
               var totalVolume=m[i].amountValue;
               var average=m[i].average;
               var weightDry=m[i].weightDry;
               var costdry=m[i].costDry;
               var size=m[i].size;
               var periode=m[i].periode;
               }
                $("#detailId").val(detailId);
                $("#idBody").val(id);
                $("#name").val(name);
                $("#totalPrice").val(totalPrice);   
                $("#weight").val(weightPcs);  
                $("#totalVolume").val(totalVolume);
                $("#average").val(average);
                $("#weightdry").val(weightDry);
                $("#costdry").val(costdry);
                $("select#size option").each(function() { this.selected = (this.text == size); });
                $("select#periode option").each(function() { this.selected = (this.text == periode);});
                }               
           });
           });
        $("#example").dataTable();
        var oTable = $("#example").dataTable().fnGetData();
        $("#choose").click(function(){
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
             $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+id+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+code+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+price+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12'    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this)' ></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%' ></td></tr>");
             }
         $('#kotak-dialog2 input[type=checkbox]').prop('checked', false);
         $('#dialog-overlay, #kotak-dialog2').hide();                
	});
         var periode="";  
        $.getJSON("data/comboPeriode.jsp",function(data){
        periode+="<option value='0' selected='selected'>Choose Periode</option>";
        $.each(data,function(index,item) 
        {
         periode+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $(".periode").html(periode); 
       
        });
                   var items="";                   
       $.getJSON("data/jsonSize.jsp",function(data){
       $.each(data,function(index,item) 
       {
        items+="<option value='"+item.id+"'>"+item.name+"</option>";
       });
       $("#size").html(items);        
       });
  
  
          $("#weightwet").mouseover(function(){
              var size=$("#size").val();
              $.ajax({
              data:"size="+size,
              url:"engobe/wetWeight.jsp",
              success:function(data){
             $("#weightwet").val(data); 
              }
              
          });
        });
               $("#weightdry").mouseover(function(){
          var size=$("#size").val();
          var weight=$("#weight").val();
          $.ajax({
              type:"POST",
              url:"body/cekWeight.jsp",
              data:"&size="+size+"&weight="+weight,
              success:function(data){
                  var dat=parseFloat(data);
                $("#weightdry").val(batasiAngka(dat,2));  
                
              }
              
          })
          
      });
        $("#costdry").mouseover(function(){
         var a=$("#weightdry").val();
         var b=$("#average").val();
         var c=a*b;
         $("#costdry").val(batasiAngka(c,2));
          }); 
          
         $("#simpan").click(function(){
            var detailId=$("#detailId").val(); 
            var idBody=$("#idBody").val();       
            var name=$("#name").val();
            var amountPrice=$("#totalPrice").val();
            var amountVolume=$("#totalVolume").val();
            var average=$("#average").val();
            var size=$("#size").val();
            var weight=$("#weight").val();
            var weightdry=$("#weightdry").val();
            var costdry=$("#costdry").val(); 
            var per=$("#periode").val();
            var keluar = {"detailId":"", "idBody":"","name":"",  "amountPrice": "", "amountVolume": "", "average":"" ,"size":"","periode":"","weight":"","weightdry":"","costdry":"","row":"", "details": []};
            var detail={ "id": "", "maks": "", "wet": "","dry":"","volume":"","harga":"" };
            var jml=$("#jml").val();
            keluar.detailId=detailId;
            keluar.idBody=idBody;
            keluar.name=name;
            keluar.amountPrice=amountPrice;
            keluar.amountVolume=amountVolume;
            keluar.average=average;
            keluar.size=size;
            keluar.periode=per;
            keluar.weight=weight;
            keluar.weightdry=weightdry;
            keluar.costdry=costdry;
            keluar.row=jml;            
            for(var i=0;i<=jml-1;i++){
                var id=$("#id_"+i).val();
                var maks=$("#maks_"+i).val();
                var wet=$("#uprecent_"+i).val();
                var dry=$("#dry_"+i).val();
                var volume=$("#volume_"+i).val();
                var harga=$("#harga_"+i).val();
                detail.id=id;
                detail.maks=maks;
                detail.wet=wet;
                detail.dry=dry;
                detail.volume=volume;
                detail.harga=harga;
                keluar.details.push(detail);
                var detail={ "id": "", "maks": "", "wet": "","dry":"","volume":"","harga":"" };                    
                                 
        } 
                var json = JSON.stringify(keluar);    
                clearData();
                $("select#cari option").each(function() { this.selected = (this.text == 'Choose Body'); });
                $("select#per option").each(function() { this.selected = (this.text == 'Choose Periode'); });
                $("select#periode option").each(function() { this.selected = (this.text == 'Choose Periode'); });
                $("#totalPrice").val("");
                $("#totalVolume").val("");
                $("#average").val("");
                $("#weight").val("");
                $("#weightdry").val("");
                $("#costdry").val(""); 
        
                  for(i=0;i<=jml-1;i++){
                     $("#id_"+i).val("");                           
                     $("#code_"+i).val("");
                     $("#wet_"+i).val("");
                     $("#volume_"+i).val("");
                     $("#harga_"+i).val("");
                     $("#maks_"+i).val("");
                    $("#dry_"+i).val("");                                          
                   $("#name").val("");                   }  
           
             $.ajax({
         url:"body/update.jsp",
         data: {data:json},
         success: function(data) {
            
            }
          
      });
         
     });
     
      });
  </script>
  <style>
   input   {
    padding-left: 3px;
}

  </style>
<section class="page_head" style="height: 2px">
			<div class="container">
				
						
                            <nav id="breadcrumbs" style="float: left">
							<ul>
								<li></li>
								<li><a href="index.html">Home</a></li>
								<li><a href="index.html">Menu</a></li>
								<li>Formula Engobe</li>
							</ul>
						</nav>
					
				
			</div> <!--./Container-->
		</section>

<section class="content elements">
    <div class="container">
         <div class="col-lg-12 col-md-12 col-sm-12">
<div id="kotak-dialog2" >
         <h3 class="title"><div id="judul"></div><a href="#" class="tutup">&#215;</a></h3>
		<div class="isi-dialog2" >
                    <br>
                    <div >
                    <table id="example" cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered  table-condensed" style="width: 95%">
						<thead>
							<tr>
                                                         
								<th>NO</th>

<th>ID</th>
<th>CODE</th>
<th>Name</th>
<th>DESC</th>
<th>UP RECENT</th>
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
        String kodeNya=idItems+"/"+kodeItems+"/"+upRecent;
                                                %>
                                                <tr class="gradeX">
<td><% out.print(no); %></td>

<td><% out.print(rs.getString("items_id")); %></td>
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
</div>
         <div class="button-wrapper" >
                             <button  id="choose" class="btn btn-default save" style="float: right">Choose</button> 
                            
         </div>	 <BR><BR>	
		</div>
    </div>
 
                        <div style="margin-bottom: 10px;">&nbsp;&nbsp;<select class="periode" style="width: 200px;height: 32px;padding-top: -3px;" id="per"></select>&nbsp;<select style="width: 200px;height: 32px;padding-top: -3px;" id="cari"></select>&nbsp;<button id="go" class="btn btn-default" ><i class="fa fa-search"></i></button>
                            </div>     
<table class="table-responsive table-condensed  table-bordered" id="itemsTable" style="width: 100%">
<thead>
   <tr>
       <th style="width: 5%" >ID</th>
<th>ITEM CODE</th>
<th>MAX H20</th>
<th>LAST PRICE</th>
<th>UPDATE PRICE</th>
<th>PRICE DRY</th>
<th>VOLUME %</th>
<th>RP</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
                        <input type="hidden" id="detailId"  />
                        <input type="hidden" id="idBody"  />
<input type="hidden" name="jml"  id="jml"  >
<div style="margin-top: 20px">
<table  id="konten"  style="width: 100%; padding: 10px"  >
     <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Body Name</td>
                 
                      <td style="width: 20%">   <input type="text" class="name" name="name" id="name"  required style="width: 100%"></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td lign="left"  style="width: 20%">Periode</td>
                             
                          <td> <select id="periode" style="width: 100%" class="periode">
                                
                      </select></td>
                  </tr>
      <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Amount Price</td>
                 
                      <td style="width: 20%">   <input type="text" class="totalPrice" name="totalPrice" id="totalPrice" readonly required style="width: 100%"></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td lign="left"  style="width: 20%">Weight/Pcs</td>
                             
                  <td>  <input type="text" class="weight span11" name="weight" id="weight" readonly required style="width: 100%"></td>
                  </tr>
                         
            <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Amount Volume</td>
                 
                      <td style="width: 20%">  <input type="text" class="totalVolume span11" name="totalVolume" id="totalVolume" readonly required style="width: 100%"></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td lign="left"  style="width: 20%">Weight(DRY) kg/m2</td>
                             
                             <td style="width: 20%">  <input type="text" class="weightdry span11" id="weightdry" name="weightdry" readonly required style="width: 100%"></td>
                  </tr> 
                  
                  <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Average</td>
                 
                      <td style="width: 20%"> <input type="text" class="average span11" name="average" id="average" readonly required style="width: 100%"></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td lign="left"  style="width: 20%">Cost DRY</td>
                             
                             <td style="width: 20%"> <input type="text" class="costdry span11" id="costdry" name="costdry" readonly required style="width: 100%"></td>
                  </tr>   
                  <tr>
                      <td height="28" align="left"  class="header_tabel" style="width: 20%">Choose Size</td>
                 
                      <td style="width: 20%">   <select id="size" style="width: 100%" name="size">
                              
                  </select></td>
                  <td style="width: 8%">&nbsp;</td>
                  <td lign="left"  style="width: 20%">&nbsp;</td>
                             
                  <td style="width: 20%"> <button class="btn btn-primary btn-block" type="button" id="simpan"> <i class="fa fa-save"></i> Update Formula</button></td>
                  </tr>
                  
                  
                   
                  
                   
                
              </table>
</div>
    </div>
</section>
   <div class="fa-hover col-md-3 col-sm-4"><a href=""><i class="fa fa-wrench"></i> fa-wrench</a></div>