$(document).ready(function(){

    $("#code").focus();
        var table = $('#itemsTable').DataTable({  
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
                    
            
        $('#itemsTable tbody').on( 'click', 'tr', function () {
                        if ( $(this).hasClass('selected') ) {
                                $(this).removeClass('selected');
                        }
                        else {
                                table.$('tr.selected').removeClass('selected');
                                $(this).addClass('selected');
                            }
                } );    
        $("#remove").click(function(){
                table.row('.selected').remove().draw( false );
                    }); 
//JSON DATA COMBO BOX
        var periode,ro,per,items,color;
                $.getJSON("jsonData/jsonColor.jsp",function(data){
                   // color+="<option value='0'></option>";
                    $.each(data,function(index,item) 
                    {
                    color+="<option value='"+item.id+"'>"+item.name+"</option>";
                    });
                    $("#color").html(color); 
                 }); 
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
                $.getJSON("jsonData/jsonPeriode.jsp",function(data){
                    $.each(data,function(index,item) 
                        {
                         per+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $("#periode").html(per); 
                    });
                $.getJSON("jsonData/jsonSize.jsp",function(data){
                    $.each(data,function(index,item) 
                        {
                        items+="<option value='"+item.id+"'>"+item.name+"</option>";
                        });
                        $("#size").html(items); 
                   });

$("#code").select2();
$("#code").change(function(){
    $("#volume").focus();
    
});
 

var data;
       $.getJSON("jsonData/jsonItem.jsp",function(data){  
       $("#data").select2("val", "");
       $.each(data,function(index,item) 
         {
      data+="<option value='"+item.id+"'>"+item.code+'  -  '+item.desc+'  -  (Rp.'+item.price+")</option>";
       });
       $("#code").html(data);
      });  

        $("#addRow").click(function(){
            var id=$("#code").val();
            var value = $('#code').select2('data').text;            
            var volume=$("#volume").val();
            if(id==""){
                alert("item can't empty");
                }
            else if(volume==""){
                
             $("#volume").focus();
            }    else{
            $("#itemsTable").dataTable().fnAddData([id,value,volume]);  
            $("#code").select2("open");
            $("#volume").val("");
            $('#itemsTable tbody td:not(.readonly)').editable(function(v, s) {
            console.log(v);
                    return (v);
    });
    
            }    
                       
                       
                        });
                        
            $("#volume").keyup(function(event){
            if(event.keyCode == 13 ){
                  var id=$("#code").val();
            var value = $('#code').select2('data').text;            
            var volume=$("#volume").val();
            if(id==""){
                alert("item can't empty");
                }
            else if(volume==""){
             $("#volume").focus();
            }    else{
            $("#itemsTable").dataTable().fnAddData([id,value,volume]);  
            $("#code").select2("open");
            $("#volume").val("");
            $('#itemsTable tbody td:not(.readonly)').editable(function(v, s) {
            console.log(v);
                    return (v);
    });
    
            }    
                
          }});
           
           
});