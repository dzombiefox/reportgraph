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
    function totalHarga(tmpObj){
        var tmpTotal = 0;
	var tmpAngka = 0;
        var jml = document.getElementsByName('jml')[0].value;
        for(var x=0; x <jml; x++) {
		tmpAngka = document.getElementsByName("harga_"+x)[0].value;
		tmpTotal = parseFloat(tmpTotal) + parseFloat(tmpAngka);
		
	}
        var tot=batasiAngka(tmpTotal,2);
	$("#totalPrice").val(tot);
         
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
          var wet = document.getElementsByName('recent_'+x)[0].value;
          
          var tot=batasiAngka(parseFloat(volume/persen)*parseFloat(wet),2);
          if(isNaN(tot)){
              document.getElementsByName('harga_'+x)[0].value=0;
          }
          else{
          document.getElementsByName('harga_'+x)[0].value =tot; 
      }}
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
       
    function batasiAngka(angka,digit){
        return angka.toFixed(digit);
    }


$(document).ready(function(){   
          $("#per").change(function(){
          var per=$("#per").val();
          clearData();
          var comboBody="";
          $.getJSON("alumina/comboAlumina.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Alumina</option>";
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
              url:"alumina/cekWeight.jsp",
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
               url:"alumina/go.jsp",
               data:"cari="+cari,
               success:function(data){         
           var obj = JSON.parse(data);
           var length = Object.keys(obj).length;
       $("#jml").val(length);
       for(var i=0;i<length;i++){
           var idNya=obj[i].id; 
           var codeNya=obj[i].code;
           var priceWet=obj[i].priceWet;
           var volume=parseFloat(obj[i].volume);           
           var price=obj[i].price;          
           var uprecent=obj[i].uprecent;    
           $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+idNya+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+codeNya+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+priceWet+"></td><td style='padding-top:5px'><input type='text' name='recent_"+i+"' id='recent_"+i+"' class='recent_"+i+" span12'   readonly style='width: 100%' value="+uprecent+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12' style='width: 100%' value="+volume+" onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this),totalHarga(this);totalAverage(this)'></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%'  value="+price+"></td></tr>");         
        }
        }      
           });
           $.ajax({
               url:"alumina/head.jsp",
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
                $("#idAlumina").val(id);
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
             $("#itemsTable tbody").append("<tr><td style='padding-top:5px'><input type='text' name='id_"+i+"' id='id_"+i+"' class='id_"+i+" span12'   readonly style='width: 100%' value="+id+"></td><td style='padding-top:5px'><input type='text' name='code_"+i+"' id='code_"+i+"' class='code_"+i+" span12'   readonly style='width: 100%' value="+code+"></td><td style='padding-top:5px'><input type='text' name='wet_"+i+"' id='wet_"+i+"' class='wet_"+i+" span12'   readonly style='width: 100%' value="+price+"></td><td style='padding-top:5px'><input type='text' name='volume_"+i+"' id='volume_"+i+"' class='volume_"+i+" span12'    style='width: 100%' onblur='amountPrice(this);totalVol(this),totalHarga(this);totalAverage(this),totalHarga(this);totalAverage(this)' ></td><td style='padding-top:5px'><input type='text' name='harga_"+i+"' id='harga_"+i+"' class='harga_"+i+" span12'   readonly style='width: 100%' ></td></tr>");
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
          var idAlumina=$("#idAlumina").val();
          var name=$("#name").val();
          var totalPrice=$("#totalPrice").val();
          var weight=$("#weight").val();
          var average=$("#average").val();
          var weightdry=$("#weightdry").val();
          var totalVolume=$("#totalVolume").val();
          var costdry=$("#costdry").val();
          var size=$("#size").val();
          var row=$("#jml").val();
          var per=$("#periode").val();
          var keluar = {"detailId":"", "idAlumina":"","name": "", "totalPrice": "", "weight":"","periode":"" ,"average":"","weightdry":"","totalVolume":"","costdry":"","size":"","row":"", "details": []};
          var detail={ "id": "", "wet": "", "volume": "","harga":"" };
          keluar.detailId=detailId;
          keluar.idAlumina=idAlumina;
          keluar.name=name;
          keluar.totalPrice=totalPrice;
          keluar.weight=weight;
          keluar.periode=per;
          keluar.average=average;
          keluar.weightdry=weightdry;
          keluar.totalVolume=totalVolume;
          keluar.costdry=costdry;
          keluar.size=size;
          keluar.row=row;
          for(i=0;i<=row-1;i++){
             var id=$("#id_"+i).val();
             var wet=$("#recent_"+i).val();
             var volume=$("#volume_"+i).val();
             var harga=$("#harga_"+i).val(); 
             detail.id=id;
             detail.wet=wet;
             detail.volume=volume;
             detail.harga=harga;
             keluar.details.push(detail);
             detail={ "id": "", "wet": "", "volume": "","harga":"" };
          }
          var json = JSON.stringify(keluar); 
          $("#name").val("");
       $.ajax({
              url:"alumina/update.jsp",
              data:{data:json},
              success:function(data){
                  
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
<th>LAST PRICE</th>
<th>UPDATE PRICE</th>
<th>VOLUME</th>
<th>RP</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
                        <input type="hidden" id="detailId"  />
                        <input type="hidden" id="idAlumina"  />
<input type="hidden" name="jml"  id="jml"  >
<div style="margin-top: 20px">
<table  id="konten"  style="width: 100%; padding: 10px"  >
                 <tr>
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Alumina Name</td>
                      
                      <td>
                         <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                             <input type="text"  name="name" id="name"  style="width: 100%" >
                              
                            </div>
					  </td>
                                          <td>&nbsp;</td>
                                          
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Periode </td>
                      
                      <td>
                          <select id="periode" style="width:100%" class="periode"></select>
					  </td>                      
                  </tr>   
                  <tr>
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Amount Price</td>
                      
                      <td>
                         <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                             <input type="text" class="totalPrice span11" name="totalPrice" id="totalPrice" readonly style="width: 100%" >
                              
                            </div>
					  </td>
                                          <td>&nbsp;</td>
                                          
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Weight Wet /PCS </td>
                      
                      <td>
                         <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                             <input type="text" class="weight span11" name="weight" id="weight" required maxlength="7" style="width: 100%">
                              
                            </div>
					  </td>                      
                  </tr>
                   
                  <tr>
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Average</td>
                      
                      <td>   <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                              <input type="text" class="average span11" name="average" id="average" readonly style="width: 100%">
                                
                            </div></td>
                      <td>&nbsp;</td>  
                      
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Weight(DRY) kg/m2</td>
                    
                      <td>   <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                                       <input type="text" class="weightdry span11" id="weightdry" name="weightdry" readonly style="width: 100%" >
                                
                            </div></td>
                  </tr>
                  <tr>
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px;font-size: 12px;">Amount Volume</td>
                     
                      <td>   <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                             <input type="text" class="totalVolume span11" name="totalVolume" id="totalVolume" readonly style="width: 100%">
                               
                            </div></td>
                      <td>&nbsp;</td>  
                      <td height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Cost DRY</td>
                      
                      <td>   <div class='input-prepend'> <span class='add-on'><i class='icon-check'></i></span>
                              <input type="text" class="costdry span11" id="costdry" name="costdry"  readonly style="width: 100%">
                               
                            </div></td>
                  </tr>   
                    <tr>
                      <td  height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">Choose Size</td>
                 
                      <td >   <select id="size" style="width: 100%">
                              
                  </select></td>
                  <td >&nbsp;</td>
               <td >&nbsp;</td>
                  <td > <button class="btn btn-primary btn-block" type="button" id="simpan"> <i class="fa fa-save"></i> Update Formula</button></td>
                  </tr>
              </table>

</div>
    </div>
</section>
   <div class="fa-hover col-md-3 col-sm-4"><a href=""><i class="fa fa-wrench"></i> fa-wrench</a></div>