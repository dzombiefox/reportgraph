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
$(document).ready(function () {           
      //document.getElementById("itemsTable").contentEditable = true;
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
$("#go").click(function(){
            clearData();
            $("#itemsTable tbody tr").remove(); 
            var cari=$("#cari").val();
            $.ajax({
               url:"body/go.jsp",
               data:"cari="+cari,
               success:function(data){         
var obj = JSON.parse(data);
var length = Object.keys(obj).length;
       for(i=0;i<length;i++){
           var idNya=obj[i].id; 
           var codeNya=obj[i].code+"-"+obj[i].desc+"("+obj[i].uprecent+")";
           var volume=obj[i].volume;    
           $("#itemsTable").dataTable().fnAddData([idNya,codeNya,volume]);
           $("#itemsTable").dataTable().fnDraw();
           $('#itemsTable tbody td:not(.readonly)').editable(function(v, s) {
           // var oTable = $("#itemsTable").dataTable().fnGetData();
                              
         var oTables=$('#itemsTable').DataTable({  
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
          var idItem= $("#itemsTable").dataTable().fnGetData( this, 1 );
          alert(idItem);
            console.log(v);
            return (v);
            //var sData = oTable.fnGetData( this );

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
                if(water==""){
                $.Notify({                
                content: awater,
                type: 'alert'                
                });    
                $("#water").focus();            
                } 
                else if(name==""){
                $.Notify({                
                content: aname,
                type: 'alert'                
                });    
                $("#name").focus();            
                }                     
                else if(weight==0){
                $.Notify({                
                content: asize,
                type: 'alert'                
                });    
                $("#weight").focus();            
                } 
        else{            
            var keluar = {"name":"","body":"","ro":"","water":"" ,"size":"","periode":"","weight":"","row":"", "details": []};
            var detail={ "id": "", "volume":""};
            var jml=$("#jml").val(); 
            var jml=oTable.length;
            keluar.name=name;
            keluar.body=body;
            keluar.size=size;
            keluar.periode=per;
            keluar.weight=weight;         
            keluar.row=jml;           
            keluar.ro=ro;
            keluar.water=water;
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
            detail = {"id": "", "volume": ""};
                                                    }
                                                    
            var json = JSON.stringify(keluar);
          
           // alert(json)
            clearPartial();
               $.ajax({
                url:"body/save.jsp",
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
    <li><a href="#">Body</a></li>
    <li><a href="#">Edit Body</a></li>
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
        </select>  <input type="text" id="water" style="border: 1px solid #D9D9D9;height: 30px;padding-left: 5px" placeholder="volume"/>
    </p>
</fieldset> 
         
<table  id="konten"  style="width: 100%; padding: 10px"  >
     <tr>
        <td height="28" align="left"  class="header_tabel" style="width: 20%">Body Name</td>
        <td style="width: 20%">   <div class="input-control text full-size"><input type="text" class="name" name="name" id="name"   style="width: 100%"></div></td>
        <td style="width: 8%">&nbsp;</td>
        <td align="left"  style="width: 20%"><span class="header_tabel" style="width: 20%">Choose Size</span></td>
        <td><div class="input-control text full-size"><select name="size" id="size" style="width: 100%" onchange="weightPcs()" >
        </select></div>
        </td>
     </tr>
     <tr>
        <td height="28" align="left"  class="header_tabel" style="width: 20%">Body Choose</td>
        <td style="width: 20%"><div class="input-control text full-size"><select id="body">
           <option>Normal</option>
           <option>Thin</option>
           </select></div>
        </td>
        <td style="width: 8%">&nbsp;</td>
        <td align="left"  style="width: 20%">Weight/Pcs</td>
        <td><div class="input-control text full-size"><input type="text" class="weight span11" name="weight" id="weight" readonly="readonly" required="required" style="width: 100%" /></div></td>
      </tr>
      <tr>
        <td height="28" align="left"  class="header_tabel" style="width: 20%">Periode</td>
        <td style="width: 20%"><div class="input-control text full-size"><select name="periode" id="periode" style="width: 100%">
            </select></div>
        </td>
        <td style="width: 8%">&nbsp;</td>
        <td align="left"  style="width: 20%">&nbsp;</td>
        <td style="width: 20%"><button class="button primary" type="button" id="simpan"> Save Formula</button></td>
      </tr>   
</table>   
</div>