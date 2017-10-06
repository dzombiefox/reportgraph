<style>
    .tableInput td { padding: 5px; } 
    
</style>
<script>  
    function disabled(){
        $("#ref").prop("disabled", true);
        $("#motif").prop("disabled", true);
        $("#size").prop("disabled", true); 
        $("#periode").prop("disabled", true);
        $("#color").prop("disabled", true);
        $("#option").prop("disabled", true);
        $("#body").prop("disabled", true); 
        $("#alumina").prop("disabled", true);
        $("#engobe").prop("disabled", true);
        $("#glaze").prop("disabled", true);
        $("#drop").prop("disabled", true);        
        $("#save").attr("disabled","disabled");
        $('#rollerData input[type=checkbox]').prop('checked', false);
        $('#optionData input[type=checkbox]').prop('checked', false);
        $("#optionData").html("");
        $("#rollerData").html("");
    }
    function enabled(){
        $('#motif').select2('enable');      
        $("#size").select2('enable');
        $("#periode").select2('enable');
        $("#color").select2('enable');
        $("#ref").select2('enable');
        $("#body").select2('enable');
        $("#alumina").select2('enable');
        $("#engobe").select2('enable');
        $("#glaze").select2('enable');
        $("#drop").select2('enable');
        $("#save").removeAttr("disabled");
        
    }
    
    function saveTile(){
       var motif=$("#motif").val();
	  
       var size=$("#size").val();
       var periode=$("#periode").val();
       var color=$("#color").val();
       var option=$("#option").val();
       var body=$("#body").val();
       var alumina=$("#alumina").val();
       var engobe=$("#engobe").val();
       var glaze=$("#glaze").val();
       var drop=$("#drop").val();
       var finish=$("#finish").val();
       var ref=$("#ref").val();
       var cRoller = [];
       var cPasta=[];
       var cInk=[];      
       $('.dInk:checked').each(function(){
       cInk.push($(this).val());
          });
       $('.dPasta:checked').each(function(){
            cPasta.push($(this).val());
        });
       $('.dRoller:checked').each(function() {
            cRoller.push($(this).val());
        });
         disabled();
       if(color==1){
          var keluar={"motif":"","size":"","periode":"","color":"","body":"","alumina":"","engobe":"","glaze":"","drop":"","finish":"","ref":""}; 
            keluar.motif=motif;
            keluar.size=size;
            keluar.periode=periode;
            keluar.color=color;
            keluar.body=body;
            keluar.alumina=alumina;
            keluar.engobe=engobe;
            keluar.glaze=glaze;
            keluar.drop=drop;
            keluar.finish=finish;
            keluar.ref=ref;
            var json=JSON.stringify(keluar);   
           //alert(json);
		 
              $.ajax({
                data:{data:json},
                url:"finish/saveWhite.jsp",
                success:function(data){
                //alert(data);
         }
         
     }); 
       }
       else{
           if(option==1){ 
           var jRoller=cRoller.length;
           var jPasta=cPasta.length;
           var keluars={"motif":"","size":"","periode":"","color":"","option":"","body":"","alumina":"","engobe":"","glaze":"","drop":"","rowpasta":"","rowroller":"","dataPastas":[],"dataRollers":[],"finish":"","ref":""};
            keluars.motif=motif;
            keluars.size=size;
            keluars.periode=periode;
            keluars.color=color;
            keluars.body=body;
            keluars.alumina=alumina;
            keluars.engobe=engobe;
            keluars.glaze=glaze;
            keluars.option=option;
            keluars.rowpasta=jPasta;
            keluars.rowroller=jRoller;
            keluars.finish=finish;
            keluars.drop=drop;
            keluars.ref=ref;
            var dataPasta={"id":""};
            var dataRoller={"id":""};
             for(i=0;i<jPasta;i++){
                var idPasta=cPasta[i];
                dataPasta.id=idPasta;
                keluars.dataPastas.push(dataPasta);
                dataPasta={"id":""};  
                }                
             for(i=0;i<jRoller;i++){
                var idRoller=cRoller[i];
                dataRoller.id=idRoller;
                keluars.dataRollers.push(dataRoller);
                dataRoller={"id":""};  
                }  
                var jsons=JSON.stringify(keluars);
               // alert(jsons);
                $.ajax({
                        data:{data:jsons},
                        url:"finish/savePasta.jsp",
                        success:function(data){            
                 }
           });
           $.ajax({
                data:{data:jsons},
                    url:"finish/saveRoller.jsp",
                    success:function(data){
                    }               
           });
           }
        if(option==2){            
     var jInk=cInk.length;
     var keluar={"motif":"","size":"","periode":"","color":"","option":"","body":"","alumina":"","engobe":"","glaze":"","drop":"","row":"","dataInks":[],"finish":"","ref":""};
     keluar.motif=motif;
     keluar.size=size;
     keluar.periode=periode;
     keluar.color=color;
     keluar.body=body;
     keluar.alumina=alumina;
     keluar.engobe=engobe;
     keluar.glaze=glaze;
     keluar.option=option;
     keluar.row=jInk;
     keluar.finish=finish;
     keluar.drop=drop;
     keluar.ref=ref;
     var dataInk={"id":""};    
     for(i=0;i<jInk;i++){
                var idInk=cInk[i];
                dataInk.id=idInk;
                keluar.dataInks.push(dataInk);
                dataInk={"id":""};  
                } 
         var json=JSON.stringify(keluar);         
         $.ajax({
         data:{data:json},
         url:"finish/saveInk.jsp",
         success:function(data){
          //  alert(data);
         }
         
     });
   
    }
}       
    }    
function cekSize(){           
       var periode=$("#periode").val();
       var size=$("#size").val();
       var body="";
       var alumina="";
       var drop="";
       var engobe="";
       var glaze="";
       $.getJSON("finish/comboBody.jsp?size="+size+"&periode="+periode,function(data){  
            $("#body").select2("val", "");
            $.each(data,function(index,item) 
                {  body+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
              $("#body").html(body);        
             });
       $.getJSON("finish/comboAlumina.jsp?size="+size+"&periode="+periode,function(data){ 
           $("#alumina").select2("val", "");
            $.each(data,function(index,item) 
                {
                 alumina+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#alumina").html(alumina); 
            });  
       $.getJSON("finish/comboDrop.jsp?size="+size+"&periode="+periode,function(data){ 
            drop+="<option value='0'>NO Using Drop</option>";
             $("#drop").select2("val", "");
            $.each(data,function(index,item)                 
                {
                 drop+="<option value='"+item.id+"'>"+item.name+"</option>";
                });
                $("#drop").html(drop); 
      });      
       $.getJSON("finish/comboEngobe.jsp?size="+size+"&periode="+periode,function(data){  
            $("#engobe").select2("val", "");
       $.each(data,function(index,item)      
    {
      engobe+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#engobe").html(engobe);        
    });
   $.getJSON("finish/comboGlaze.jsp?size="+size+"&periode="+periode,function(data){  
       $("#glaze").select2("val", "");
       $.each(data,function(index,item) 
         {
      glaze+="<option value='"+item.id+"'>"+item.name+"</option>";
       });
       $("#glaze").html(glaze);
      });      
        }    
    function cekColor(){
        var color=$("#color").val();      
           
         disabled();
     
     
      
        
    }
    
    function clear(){
        $("#saveTile").removeAttr("disabled");
        $("#idNya").val("");
        
    }
    $("#document").ready(function(){
        disabled();
     $('#color').on("change", function(e) {
         var color=$("#color").val();
         if(color==1){
         $('.opt').select2("enable",false);
         $("#optionData").html("");
         $("#rollerData").html("");
        } 
        else{   
            $('.opt').select2("enable",true);
            $('.opt').select2("disable",false);
            
        }
})
      // disabled();
        $("#motif").select2({
            placeholderOption: 'first'
        });
        $("#size").select2({
            placeholderOption: 'first'
        });
         $("#periode").select2({
            placeholderOption: 'first'
        });
        $("#color").select2({
            placeholderOption: 'first'
        });
        $("#option").select2({
            placeholderOption: 'first'
        });
        $("#body").select2({
             placeholder: "Enter name",
             placeholder: "Select a state",
             allowClear: true
        });
        $("#alumina").select2({
             placeholder: "Enter name",
             placeholder: "Select a state",
             allowClear: true
        });
         $("#engobe").select2({
             placeholder: "Enter name",
             placeholder: "Select a state",
             allowClear: true
        });
         $("#glaze").select2({
             placeholder: "Enter name",
             placeholder: "Select a state",
             allowClear: true
        });
         $("#drop").select2({
             placeholder: "Enter name",
             placeholder: "Select a state",
             allowClear: true
        });
         $("#ref").select2({
             placeholder: "Select ref code ",
             placeholder: "Select a state",
             allowClear: true
        });
        
           
        $("#new").on('click',function(){
           
            $.ajax({
                url:"finish/cekId.jsp",
                success:function(data){                    
                    $("#finish").val(data);
                    enabled();
                }
           });
            
        });     
       var periode="";  
        $.getJSON("jsonData/jsonPeriode.jsp",function(data){
        periode+="<option value='0' selected='selected'>Choose Periode</option>";
        $.each(data,function(index,item) 
        {
         periode+="<option value='"+item.id+"'>"+item.name+"</option>";
        });
        $("#periode").html(periode); 
    });
$('#roller').click(function(){
      if (this.checked) {        
    $("#rollerData").load("tile/dataRoller.jsp");
    }
         else{
       $("#rollerData").html("");
    }
}); 
       
        $("#option").change(function(){
            var periode=$("#periode").val();      
            var option=$("#option").val();
            var color=$("#color").val();
            if(option==1){  
            $('#optionData').html('<img id="loader" src="image/loader.gif">');   
            var target="finish/dataPasta.jsp?periode="+periode;
            //$("#optionData").load("finish/dataPasta.jsp?periode="+periode).delay(35).fadeIn('slow');
               
    $("#optionData").load("finish/dataPasta.jsp?periode="+periode).delay(35).fadeIn('slow');
    
        }
        else if(option==2){            
            $('#optionData').html('<img id="loader" src="image/loader.gif">');  
            $('#loader').fadeIn('normal');          
            $("#optionData").load("finish/dataInk.jsp?periode="+periode+"&color="+color).delay(35).fadeIn('slow');
          }
        else{          
            $('#optionData').html('<img id="loader" src="image/loader.gif">');  
            $("#optionData").html("").hide().fadeOut(4000);
             $("#option").select2("val", "");
        }
        });
        var items="";
        var items2="";
        var items3="";
         $.getJSON("jsonData/jsonMotif.jsp",function(data){
      items+="<option value='0' selected='selected'>choose motif</option>"; 
  $.each(data,function(index,item) 
    {
      items+="<option value='"+item.id+"'>"+item.name+" "+item.tipe+" "+item.option+"</option>";
    });
    $("#motif").html(items); 
       
  });
  $.getJSON("jsonData/jsonSize.jsp",function(data){
      items2+="<option value='0'></option>";
  $.each(data,function(index,item) 
    {
      items2+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#size").html(items2); 
       
  });
         $.getJSON("jsonData/jsonColor.jsp",function(data){
      items3+="<option value='0'></option>";
  $.each(data,function(index,item) 
    {
      items3+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#color").html(items3); 
       
  });    
       
   $("#size").change(function(){
       cekSize();
   });       
   
   $("#motiv").change(function(){
       cekSize();
   });
        
     

});
    window.onunload=function(){return true;};
    function uncheck() {
    // Uncheck all checkboxes on page load    
    $("input:checkbox:checked").attr("checked", false);
    console.log("uncheck");
}
</script>
<body onLoad="uncheck()">
  
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Finish</a></li>
    <li><a href="#">Create Finish Good</a></li>
</ul>  
<hr class="thin bg-grayLighter">  
  <div id="wrapper">
        <input type="hidden" value="<%=session.getAttribute("id")%>"  id="id">
        <div class="example" data-text="Form Create Finish good">
        <table style="width: 100%"  >
        <tr>
          <td >Motif Tile</td>
          <td width="35%"><select id="motif" style="width: 100%" name="motif"> </select></td>
          <td>&nbsp;</td>
          <td>Body  </td>
          <td >
              <select id="body" style="width: 100%" >
                  <option>Select Body</option>
              </select>
       
    </td>
        </tr>
        <tr>
            <td >Size</td>
          
            <td >
                    <select id="size" onchange="cekSize();" style="width: 100%" ></select>
         </td>
<td>&nbsp;</td>
<td>Alumina</td>
<td >
        <select id="alumina" style="width: 100%"> <option>Select Alumina</option></select>
</td>
        </tr>
        
           <tr>
            <td>Periode</td>
          
            <td>
                    <select id="periode" onchange="cekSize();" style="width: 100%">
                       
                    </select>
 </td>
<td>&nbsp;</td>
<td>Engobe</td>
<td>
        <select id="engobe" style="width: 100%"> <option>Select Engobe</option></select>
</td>
        </tr>
        
   <tr>
            <td>Color</td>
          
            <td>
                <select id="color"  style="width: 100%"></select>
                </td>
<td>&nbsp;</td>
<td>Glaze</td>
<td>
        <select id="glaze" style="width: 100%"> <option>Select Glaze</option></select>
</td>
        </tr> 
           <tr>
            <td>Option</td>
          
            <td>

                <select id="option" style="width: 100%" class="opt">
                        <option selected="selected"></option>
                        <option value="1">Pasta</option>
                        <option value="2">Digital Printing </option>
                    </select>

</td>
<td></td>
<td>DROP</td>
<td>
   
    <select id="drop" style="width: 100%">
                         <option>Select Drop</option>
                    </select>

</td>
        </tr> 
         
  <tr>
            <td>Code Ref</td>
          
            <td><select id="ref" style="width: 30%">
                    <option>></option>
                    <option><</option>
                    <option>+</option>
                    <option>=</option>
                </select></td>
            <td>&nbsp;</td>
<td></td>
<td>
    
  <button class="button warning" id="new">NEW </button>&nbsp;<button class="button primary" onclick="saveTile()" id="save">SAVE</button>  
</td>
        </tr>        
     
       
    </table> 
            <input type="text" id="finish"  style="border: 1px solid #ffffff;color: #ffffff" readonly="readonly"/>      
       <input type="text" id="idNya" readonly style="  background-color: transparent;
    border: 0px solid;
    height: 20px;
    width: 160px;
    color: white" />

                 
         <div id="optionData">           
             
             
         </div>                
         <div id="rollerData"></div>      
             
         </div>
               
               
         
         
      
			
				
					
					
                <!-- Contextual button for informational alert messages -->
              
          

					
				
			
		

                
                
            
</div>

</body>  