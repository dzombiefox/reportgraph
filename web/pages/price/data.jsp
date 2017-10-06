<script>
    function editData(){
         var idItem=$("#idItem").val();      
         $.ajax({
            data:"id="+idItem,
            url:"price/edit.jsp",
            success:function(data){
            var w=JSON.parse(data);
            $("#update").show();
            $("#save").hide();
            $("#dialogAdd").dialog("open");
            $("#name").val(w.item_name);
            $("#code").val(w.item_code);
            $("#hpp1").val(w.hpp1);
            $("#hpp2").val(w.hpp2);
            $("#hpp3").val(w.hpp3);
            $("#hpp4").val(w.hpp4);
            $("#hpp5").val(w.hpp5);
			$("#hpp6").val(w.hpp6);
            $("#sell1").val(w.sell1);
            $("#sell2").val(w.sell2);
            $("#sell3").val(w.sell3);
            $("#sell4").val(w.sell4);
            $("#sell5").val(w.sell5);
			$("#sell6").val(w.sell6);
            var target=w.line+"-"+w.type+"("+w.size+")";
            $("#motif").select2("data", {id:w.motif_id  ,text: w.motif });
            $("select#motif option").each(function() { this.selected = (this.text == w.motif); });
            $("select#brand option").each(function() { this.selected = (this.text == w.brand); });
            $("select#target option").each(function() { this.selected = (this.text == target); });
            $("#target").select2("data", { id:w.persenid ,text: target });
            }
        });
       
             
        
    }
    function kosong(){
        $("#name").val("");
        $("#code").val("");
        $("#hpp1").val("");
        $("#hpp2").val("");
        $("#hpp3").val("");
        $("#hpp4").val("");
        $("#hpp5").val("");
        $("#sell1").val("");
        $("#sell2").val("");
        $("#sell3").val("");
        $("#sell4").val("");
        $("#sell5").val("");     
       }
    function savePrice(){
        var aname= "ITEM NAME  Can't empty";
        var acode= "Sory code Items Can't empty";
        var name=$("#name").val();
        var kode=$("#code").val();
        var motif=$("#motif").val();
        var brand=$("#brand").val();
        var hpp1=$("#hpp1").val();
        var hpp2=$("#hpp2").val();
        var hpp3=$("#hpp3").val();
        var hpp4=$("#hpp4").val();
        var hpp5=$("#hpp5").val();
		var hpp6=$("#hpp6").val();
        var sell1=$("#sell1").val();
        var sell2=$("#sell2").val();
        var sell3=$("#sell3").val();
        var sell4=$("#sell4").val();
        var sell5=$("#sell5").val();  
		var sell6=$("#sell6").val();  		
        var target=$("#target").val();
        var periode=$("#periode").val();
        var tahun=$("#tahun").val();
        var keluar = { "nama":"","kode":"" ,"motif":"","brand":"","target":"","hpp1":"","hpp2":"","hpp3":"","hpp4":"","hpp5":"","hpp6":"","sell1":"","sell2":"","sell3":"","sell4":"","sell5":"","sell6":"","tahun":"","periode":""};
         keluar.nama=name;
         keluar.kode=kode;
         keluar.motif=motif;
         keluar.brand=brand;
         keluar.target=target;
         keluar.hpp1=hpp1;
         keluar.hpp2=hpp2;
         keluar.hpp3=hpp3;
         keluar.hpp4=hpp4;
         keluar.hpp5=hpp5;
		 keluar.hpp6=hpp6;
         keluar.sell1=sell1;
         keluar.sell2=sell2;
         keluar.sell3=sell3;
         keluar.sell4=sell4;
         keluar.sell5=sell5;
		 keluar.sell6=sell6;
         keluar.periode=periode;
         keluar.tahun=tahun;
         var json = JSON.stringify(keluar);
         
        if(name==""){
             $.Notify({                
                content: aname,
                type: 'alert'                
            });    
            $("#name").focus();
        }
        else   if(kode==""){
             $.Notify({                
                content: acode,
                type: 'alert'                
            });    
            $("#code").focus();
        }
        else{
      
            $.ajax({
            url:"price/save.jsp",
            data: {data:json},
            success:function(data){
                kosong();
                 RefreshTable("#example","price/json.jsp"); 
                 $("#dialogAdd").dialog("close"); 
            }
        });
  }
        
    }
    $(document).ready(function(){
         $("#hpp1").number( true );
         $("#hpp2").number( true );
         $("#hpp3").number( true );
         $("#hpp4").number( true );
         $("#hpp5").number( true );
		 $("#hpp6").number( true );
         $("#sell1").number( true );
         $("#sell2").number( true );
         $("#sell3").number( true );
         $("#sell4").number( true );
         $("#sell5").number( true );
         $("#sell6").number( true );
         
            var id;
            var name,code,motif,brand,hpp1,hpp2,hpp3,hpp4,hpp5,sell1,sell2,sell3,sell4,sell5;
            $('#example tbody').on( 'click', 'tr', function () {
      		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                         id= table.fnGetData( this, 1 );
                         $("#idItem").val(id);
                         /*
                         name=$('td', this).eq(1).text();
                         code=$('td', this).eq(2).text();
                         motif=$('td', this).eq(3).text();
                         brand=$('td', this).eq(4).text();
                         hpp1=$('td', this).eq(5).text();
                         hpp2=$('td', this).eq(6).text();
                         hpp3=$('td', this).eq(7).text();
                         hpp4=$('td', this).eq(8).text();
                         hpp5=$('td', this).eq(9).text();
                         sell1=$('td', this).eq(10).text();
                         sell2=$('td', this).eq(11).text();
                         sell3=$('td', this).eq(12).text();
                         sell4=$('td', this).eq(13).text();
                         sell5=$('td', this).eq(14).text();
                       */
                    }           
	} ); 
       
        $("#add").click(function(){
            $("#save").show();
            $("#update").hide();
        kosong();
        $("#dialogAdd").dialog("open");
        //kosong();
    });
               var motif="";
               var brand="";
               var target="";
     $.getJSON("price/getMotif.jsp",function(data){
         $.each(data,function(index,item) 
    {
      motif+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#motif").html(motif); 
      });
        $.getJSON("price/getBrand.jsp",function(data){
         $.each(data,function(index,item) 
    {
      brand+="<option value='"+item.id+"'>"+item.nama+"</option>";
    });
    $("#brand").html(brand); 
      });
    $.getJSON("jsonData/jsonPersen.jsp",function(data){
         $.each(data,function(index,item) 
    {
      target+="<option value='"+item.id+"'>"+item.line+"-"+item.name+"("+item.size+")</option>";
    });
    $("#target").html(target); 
      });
        $("#target").select2();
		$("#motif").select2();
           var table=$("#example").dataTable({
            /*     "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
          */       
        "sPaginationType": "full_numbers",
        ajax: "price/json.jsp"
        });
        $("#cancel").click(function(){
            
          $("#dialogRemove").dialog("close");   
        });
        $("#ok").click(function(){
            $.ajax({
               url:"price/remove.jsp",
               data:"id="+id,
               success:function(){
               $("#dialogRemove").dialog("close");  
               RefreshTable("#example","price/json.jsp");    
               id="";
               }
           });
            
        });
        $("#remove").click(function(){
         $("#dialogRemove").dialog("open");   
        
        });
        /*$("#edit").click(function(){
            $("#update").show();
            $("#save").hide();
            $("#dialogAdd").dialog("open");
            $("#name").val(name);
            
            $("select#motif option").each(function() { this.selected = (this.text == motif); });
            $("select#brand option").each(function() { this.selected = (this.text == brand); });
            $("#code").val(code);
            $("#hpp1").val(hpp1);
            $("#hpp2").val(hpp2);
            $("#hpp3").val(hpp3);
            $("#hpp4").val(hpp4);
            $("#hpp5").val(hpp5);
            $("#sell1").val(sell1);
            $("#sell2").val(sell2);
            $("#sell3").val(sell3);
            $("#sell4").val(sell4);
            $("#sell5").val(sell5);
        });*/
        $("#update").click(function(){            
        var name=$("#name").val();
        var kode=$("#code").val();
        var motif=$("#motif").val();
        var brand=$("#brand").val();
        var hpp1=$("#hpp1").val();
        var hpp2=$("#hpp2").val();
        var hpp3=$("#hpp3").val();
        var hpp4=$("#hpp4").val();
        var hpp5=$("#hpp5").val();
		var hpp6=$("#hpp6").val();
        var sell1=$("#sell1").val();
        var sell2=$("#sell2").val();
        var sell3=$("#sell3").val();
        var sell4=$("#sell4").val();
        var sell5=$("#sell5").val(); 
		var sell6=$("#sell6").val(); 		
        var target=$("#target").val();
        var keluar = { "id":"","nama":"","kode":"" ,"motif":"","brand":"","hpp1":"","hpp2":"","hpp3":"","hpp4":"","hpp5":"","hpp6":"","sell1":"","sell2":"","sell3":"","sell4":"","sell5":"","sell6":"","target":""};
         keluar.id=id;
         keluar.nama=name;
         keluar.kode=kode;
         keluar.motif=motif;
         keluar.brand=brand;
         keluar.hpp1=hpp1;
         keluar.hpp2=hpp2;
         keluar.hpp3=hpp3;
         keluar.hpp4=hpp4;
         keluar.hpp5=hpp5;
		 keluar.hpp6=hpp6;
         keluar.sell1=sell1;
         keluar.sell2=sell2;
         keluar.sell3=sell3;
         keluar.sell4=sell4;
         keluar.sell5=sell5;
		 keluar.sell6=sell6;
         keluar.target=target;
         var json = JSON.stringify(keluar);
       
      
         $.ajax({
            url:"price/update.jsp",
            data: {data:json},
            success:function(data){
                kosong();
                 RefreshTable("#example","price/json.jsp"); 
                 $("#dialogAdd").dialog("close"); 
            }
        });
        });
        
    });
</script>


<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Report Purchase</a></li>
    <li><a href="#">Monthly</a></li>
</ul>
     <hr class="thin bg-grayLighter">
     <div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="ok">OK</button>&nbsp; <button class="button default" id="cancel">Cancel</button>
     </div>
     <div data-role="dialog" id="dialogAdd" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 900px">
  
        <br><table width="980px" >
        <tr>
            <td >ITEM NAME</td>
          
            <td ><div class="input-control text full-size">
                    <input type="text" id="name" maxlength="20"></div>
          </td>
</tr>
<tr>
            <td >ITEM CODE</td>
          
            <td ><div class="input-control text full-size">
                    <input type="text" id="code" maxlength="12"></div>
          </td>
</tr>
        
<tr>
            <td>Motif </td>
          
            <td>
                    <select id="motif" style="width: 100%">
                       <option>Select Motif</option> 
                    </select>
    </td>
</tr>
<tr>
            <td>Brand </td>
          
            <td><div class="input-control text full-size" >
                    <select id="brand">
                        
                    </select>
    </div> </td>
</tr>
    <tr>
            <td>Target Line</td>
          
            <td>
                    <select id="target"  style="width: 100%">
                        <option>Select Target</option>
                    </select>
     </td>
</tr>      
<tr>
            <td>Periode</td>
          
            <td>               
                   <select id="periode"  class="input-control medium-size" style="width: 35%">
                        <option >jan-mar</option>
						<option >jan-jun</option>
                        <option >apr-jun</option>
                        <option >jul-sep</option>
                        <option>okt-dec</option>
                    </select>
                <select id="tahun"  class="input-control medium-size" style="width: 15%">
                <%
                for(int tahun=2010;tahun<2020;tahun++){
                  out.print("<option >"+tahun+"</option>");
                }
                %>
                    </select>
               
     </td>
</tr>  
 <tr>
            <td>&nbsp;HPP KW 1&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp1" value="0" >
</div>&nbsp;SELL KW1 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell1"  value="0" >
</div>
           </td>
</tr> 
 <tr>
            <td>&nbsp;HPP KW 2&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp2" value="0" >
</div>&nbsp;SELL KW2 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell2"  value="0" >
</div>
           </td>
</tr> 
 <tr>
            <td>&nbsp;HPP KW 3&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp3" value="0" >
</div>&nbsp;SELL KW3 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell3"  value="0" >
</div>
           </td>
</tr> 
 <tr>
            <td>&nbsp;HPP KW 4&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp4" value="0" >
</div>&nbsp;SELL KW4 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell4"  value="0" >
</div>
           </td>
</tr> 
 <tr>
            <td>&nbsp;HPP KW 5&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp5" value="0" >
</div>&nbsp;SELL KW5 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell5"  value="0" >
</div>
           </td>
</tr> 
<tr>
            <td>&nbsp;HPP KW 6&nbsp;</td>
          
            <td><div class="input-control text small-size">
                    <input type="text" id="hpp6" value="0" >
</div>&nbsp;SELL KW6 &nbsp;<div class="input-control text small-size">
                    <input type="text" id="sell6"  value="0" >
</div>
           </td>
</tr> 
  <tr>
            <td>&nbsp;</td>
          
            <td><button class="button primary" onclick="savePrice()" id="save">SAVE</button>&nbsp;<button class="button primary" id="update" >UPDATE</button>&nbsp;<button class="button success" onclick="kosong()" >CLEAR</button></td>
</tr> 
     
       
    </table>
    </div>
    
     <input type="hidden" name="id" id="idItem" />    
     <button class="button success" id="add">Add Price</button>&nbsp; <button class="button warning" id="edit"  onclick="editData()">Edit Price</button>&nbsp; <button class="button alert" id="remove">Remove</button>
 
       <table  id="example" class="tg condensed border bordered dataTable">
<thead>
    <tr>
        <th>No</th>
        <th>ID</th>
        <th>ITEM NAME</th>
        <th>ITEM CODE</th>
        <th>MOTIF</th>
        <th>BRAND</th>
        <th>HPP KW1</th>
        <th>HPP KW2</th>
        <th>HPP KW3</th>
        <th>HPP KW4</th>
        <th>HPP KW5</th>
		 <th>HPP KW6</th>
        <th>SELL KW1</th>
        <th>SELL KW2</th>
        <th>SELL KW3</th>
        <th>SELL KW4</th>
        <th>SELL KW5</th>
		 <th>SELL KW6</th>
		<th>LINE</th>
        <th>PERIODE</th>
    </tr>
</thead>
<tbody>
</tbody>
</table>
