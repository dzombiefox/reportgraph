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
function weightwet(){
          var size=$("#size").val();
              $.ajax({
              data:"size="+size,
              url:"glaze/wetWeight.jsp",
              success:function(data){
              $("#weightwet").val(data); 
              $.ajax({
              type:"POST",
              url:"glaze/totWeight.jsp",
              data:"size="+size,
              success:function(data){
                var dat=parseFloat(data);
                $("#weightdry").val(batasiAngka(dat,2));  
                  }              
                 });   
              }
              
          });
        
    }                
$(document).ready(function(){
    $("#per").change(function(){
           clearData();
          var per=$("#per").val();
          var comboBody="";
          $.getJSON("glaze/getGlaze.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Glaze</option>";
          $.each(data,function(index,item) 
          {
          comboBody+="<option value='"+item.id+"'>"+item.name+"&nbsp;"+item.color+"</option>";
          });
          $("#cari").html(comboBody);        
          });         
          });          
    $("#go").click(function(){
            clearData();
            $("#itemsTable tbody tr").remove(); 
            var cari=$("#cari").val();
            $.ajax({
               url:"glaze/go.jsp",
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


$("#size").change(function(){
            weightwet();
           
            
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
              var aname="name can't empty";
              var avolume="volume can't empty";
              var aItems="Items can't empty ";
              var name=$("#name").val();
              var color=$("#color").val();              
              var weight=$("#weightwet").val();
              var per=$("#periode").val();          
              var size=$("#size").val();
              var ro=$("#ro").val();
              var water=$("#water").val();
              if(name==""){
            $.Notify({                
                content: aname,
                type: 'alert'                
                });    
                $("#name").focus();
          }else{
              var jml=oTable.length;
              var keluar = { "name": "","color":"", "weight":"","periode":"" ,"size":"","row":"","ro":"","water":"", "details": []};
              var detail={ "id": "", "volume": "" };
              keluar.name=name;
              keluar.color=color;             
              keluar.weight=weight;
              keluar.periode=per;                          
              keluar.size=size;
              keluar.row=jml;
              keluar.ro=ro;
              keluar.water=water;
                if(jml<1){
                $.Notify({                
                content: aItems,
                type: 'alert'                
                }); 
             }else{
                for (var i = 0; i <jml; i++) {
                    detail.id = oTable[i][0];
                    detail.volume =oTable[i][2];
                    keluar.details.push(detail);
                    detail = {"id": "", "volume": ""};
                                             }
                var json = JSON.stringify(keluar); 
                clearPartial();
                     $.ajax({
                     url:"glaze/save.jsp",
                     data: {data:json},
                     success: function(data) {
                     }
              
          });
           detail = {"id": "", "volume": ""}; 
          }
      }
      });
    
    
});
        </script>
<ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Glaze</a></li>
    <li><a href="#">Create Glaze</a></li>
</ul>  
       <div class="example" data-text="formula Body">	
            <input type="hidden" id="id">
            <fieldset>
<legend>Formula Body </legend>     
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
    <p>
        <select id="ro" style="width: 200px;height: 30px">            
        </select> Volume Water : <input type="text" id="water" style="border: 1px solid #D9D9D9;height: 30px;padding-left: 5px"/>
    </p>
</fieldset> 
         
  
            
<table  style="width: 100%" class="table-condensed" >
                 <tr>
                      <td >Name</td>
                      
                      <td>
                         <div class="input-control text full-size">
                             <input type="text" id="name" />                              
                            </div>
		         </td>
                      <td>&nbsp;</td>
                                          
                      <td>Size </td>
                      
                      <td> <div class="input-control text full-size">
                              <select id="size" style="width: 100%">
                              
                  </select>
                              
                             
                          </div>
					  </td>                      
                  </tr> 
                  <tr>
                      <td >Periode</td>
                      
                      <td>  <div class="input-control text full-size"><select id="periode" style="width: 100%" class="periode"></select>
                          </div>
					  </td>
                                          <td>&nbsp;</td>
                                          <td>Weight(Wet) G/P </td>
                     
                      <td>
                         
                        <div class="input-control text full-size"> <input type="text" class="weightwet span11" id="weightwet" name="weightwet" readonly style="width: 100%"  >  
                              
                        </div>
					  </td>
                  </tr>
                   
                  <tr>
                      <td >Color</td>
                    
                      <td>   
                          <div class="input-control text full-size"> <select id="color"  style="width:100%">
                           </select>
                          </div>      
                            </td>
                              <td>&nbsp;</td>
                              <td ></td>
                 
                      <td>  
                             <button class="button primary" type="button" id="simpan"> <i class="fa fa-save"></i> Save Formula</button>          
                            </td>
                  </tr>
 </table>
</div>