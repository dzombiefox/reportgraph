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
    $("#per").change(function(){
          clearData();
          var per=$("#per").val();
          var comboBody="";
          $.getJSON("ink/getInk.jsp?per="+per,function(data){  
              comboBody+="<option >Choose Ink</option>";
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
               url:"ink/go.jsp",
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
              var aname="name can't empty";
              var avolume="volume can't empty";
              var aItems="Items can't empty ";
              var name=$("#name").val();
              var color=$("#color").val();              
              var per=$("#periode").val();          
              var size=$("#size").val();
              var opt=$("#option").val();
              if(name==""){
              $.Notify({                
                content: aname,
                type: 'alert'                
                });    
                $("#name").focus();
          }else{
              var jml=oTable.length;
              var keluar = { "name": "","color":"", "periode":"" ,"size":"","row":"", "details": []};
              var detail={ "id": "", "volume": "" };
              keluar.name=name;
              keluar.color=color;             
              keluar.periode=per;                          
              keluar.size=size;
              keluar.row=jml;
              keluar.option=opt;
            
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
              //  alert(json);
             
                     $.ajax({
                     url:"ink/save.jsp",
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
                    <td><div class="input-control text full-size">  <select class="periode" id="per"> </select></div></td>                  
                    <td><div class="input-control text full-size">  <select id="cari"> </select><button class="button" id="go"><span class="mif-looks"></span></button></div></td>
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
        <table  style="width: 100%" class="table-condensed" >
           <tr>
               <td >Name</td>             
               <td><div class='input-prepend'><div class="input-control text full-size"><input type="text" id="name" /></div></td>
               <td>&nbsp;</td>
               <td>Size </td>
               <td><div class="input-control text full-size"><select id="size" style="width: 100%"></select></div></td>                      
           </tr>  
           <tr>
               <td >Periode</td>                 
               <td><div class="input-control text full-size"> <select id="periode" style="width: 100%" class="periode"></select></div></td>
               <td>&nbsp;</td>
               <td></td>
               <td></td>
           </tr>
           <tr>
               <td >Color</td>                      
               <td><div class="input-control text full-size"> <select id="color" style="width: 100%"></select></div></td>
               <td>&nbsp;</td>
               <td></td>                                   
               <td><button class="button primary block" type="button" id="simpan"> <i class="fa fa-save"></i> Save Formula</button></td>
           </tr>
        </table>

</div>