<script src="../js/cogs.js" type="text/javascript"></script>
<script>   
function clearData(){
         clearPartial();       
         $("#itemsTable ").dataTable().fnClearTable(); 
         }
function clearPartial(){
                 $("#name").val("");
                 $("#weight").val("");
                 $("#water").val("");
                 $("#code").val("");
                 $("#volume").val("");
                 $("#code").focus();                
                }
$(document).ready(function(){
    $("#size").change(function(){
              var size=$("#size").val();
              $.ajax({
              data:"size="+size,
              url:"drop/getWeight.jsp",
              success:function(data){
             $("#weight").val(data); 
           
              }
              
          });
            
        });
    $("#per").change(function(){
           clearData();
          var per=$("#per").val();
          var comboBody="";
          $.getJSON("drop/getDrop.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Drop</option>";
          $.each(data,function(index,item) 
          {
          comboBody+="<option value='"+item.id+"'>"+item.name+"&nbsp;"+item.size+"</option>";
          });
          $("#cari").html(comboBody);        
          });
         
          });
          
    $("#go").click(function(){
            clearData();
            $("#itemsTable tbody tr").remove(); 
            var cari=$("#cari").val();
            $.ajax({
               url:"drop/go.jsp",
               data:"cari="+cari,
               success:function(data){         
                var obj = JSON.parse(data);
                var length = Object.keys(obj).length;
                for(i=0;i<length;i++){
                var idNya=obj[i].id; 
                var codeNya=obj[i].code;
                var volume=obj[i].volume;    
                $("#itemsTable").dataTable().fnAddData([idNya,codeNya,volume]);
                $("#itemsTable").dataTable().fnDraw();
           $('#itemsTable tbody td:not(.readonly)').editable(function(v, s) {
            //
             $('#itemsTable').DataTable({  
                "columns": [
                 { className: "readonly" },
                 { className: "readonly" },
                null
                        ],
                    "bPaginate":false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo":false,  
                    "retrieve": true,
                    });    
           
            console.log(v);
            return (v);
            });
         
       }       
               }
        });
});      
    $("#simpan").click(function(){
                        $("#itemsTable").dataTable().fnDestroy();
                $('#itemsTable').DataTable({  
                "columns": [
                 { className: "readonly" },
                 { className: "readonly" },
                null
                        ],
                    "bPaginate":false,
                    "bLengthChange": false,
                    "bFilter": false,
                    "bSort": false,
                    "bInfo":false,  
                    "retrieve": true,
                    });
          var oTable = $("#itemsTable").dataTable().fnGetData();
          var aItems="Items can't empty ";
          var avolume="volume can't empty";
          var awater="water can't empty";
          var aname="name can't empty";
          var aweight="weight/pcs can't empty";
          var name=$("#name").val();
          var weight=$("#weight").val();
          var size=$("#size").val();
          var per=$("#periode").val();
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
                $("#weight").focus(); 
              
          }
        else{     
          var jml=oTable.length;  
          var keluar = { "name": "","periode":"" ,"size":"","row":"", "weight":"", "details": []};
          var detail={ "id": "","volume": "" };
          keluar.name=name;
          keluar.weight=weight;
          keluar.periode=per;
          keluar.size=size;
          keluar.row=jml;
          if(jml<1){
                $.Notify({                
                content: aItems,
                type: 'alert'                
                }); 
            }
            else{
          for (var i = 0; i <jml; i++) {
            detail.id = oTable[i][0];
            detail.volume =oTable[i][2];
            keluar.details.push(detail);
            detail = {"id": "", "volume": ""};                                           }
          var json = JSON.stringify(keluar); 
         clearPartial();
        // alert(json)
          $.ajax({
              url:"drops/save.jsp",
              data:{data:json},
              success:function(data){
                  alert(data)
              }
              
          });
      }
      }
      });
    
    
});
        </script>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">DROP</a></li>
    <li><a href="#">Create DROP</a></li>
</ul> 
       <div class="example" data-text="formula Body">	
            <input type="hidden" id="id">
            <fieldset>
<legend>Formula DROP </legend>     
<table style="width: 100%" >
        <tr>
            <td colspan="3" style="width: 30%" ><select id="code" style="width: 100%"><option>Select Item</option></select></td>
            <td>&nbsp;</td>
           
            <td style="width: 3%"><div class="input-control text full-size">  <input type="text" id="volume" style="width: 130px; font-size:1.2em;" placeholder="volume"/><button class="button" id="addRow"><span class="mif-plus"></span></button></div></td>
            <td>
                <button class="button" id="remove"><span class="mif-cross"></span></button>
            </td>
            <td>
               <div class="input-control text full-size">  <select class="periode" id="per">
                    
                   </select></div>
            </td>
            <td>
               <div class="input-control text full-size">  <select id="cari">
                    
                   </select><button class="button" id="go"><span class="mif-looks"></span></button></div>
            </td>
        </tr>
</table>
     
    
<table id="itemsTable" style="width: 100%" class="table-bordered table table-condensed" border="1">
    <thead>
    <tr style="height: 40px">
    <td style="width:5%"  >&nbsp;&nbsp;&nbsp;ID</td>
    <td >&nbsp;&nbsp;&nbsp;ITEM CODE</td>
    <td style="width: 100px">&nbsp;&nbsp;&nbsp;VOLUME</td>
    </tr>
    </thead>
<tbody>    
</tbody>
</table>    
   
</fieldset> 
         
  
            
<table  id="konten"  style="width: 100%; padding: 10px"  >
                 <tr>
                      <td >DROP Name</td>
                      
                      <td>
                       <div class="input-control text full-size">
                             <input type="text"  name="name" id="name"  style="width: 100%" onClick="clear()">
                       </div>
					  </td>
                                          <td>&nbsp;</td>
                                          
                      <td >Size </td>
                      
                      <td><div class="input-control text full-size">
                          <select id="size" style="width:100%"></select>
                          </div>
		       </td>                      
                  </tr>   
                  <tr>
                      <td >Periode</td>
                      
                      <td>
                         <div class="input-control text full-size">
                           <select id="periode" style="width: 100%">
                              
                           </select></div>
                              
                          
					  </td>
                                          <td>&nbsp;</td>
                                          
                      <td >Weight/PCS </td>
                      
                      <td>
                         <div class="input-control text full-size">
                             <input type="text" class="weight span11" name="weight" id="weight"  maxlength="7" style="width: 100%">
                         </div>
                           
					  </td>                      
                  </tr>
                   
                
                   
                    <tr>
                      <td  height="28" align="left"  class="header_tabel" style="padding-left:24px; font-size: 12px;">&nbsp;</td>
                 
                      <td >   </td>
                  <td >&nbsp;</td>
               <td >&nbsp;</td>
                  <td > <button class="button primary" type="button" id="simpan"> <i class="fa fa-save"></i> Save Formula</button></td>
                  </tr>
              </table>            
            
</div>