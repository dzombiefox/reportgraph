<%@page import="formula.roller"%>
<%@page import="formula.pasta"%>
<%@page import="formula.ink"%>
<%@page import="formula.glaze"%>
<%@page import="formula.engobe"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="formula.alumina"%>
<%@page import="formula.body"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style>
    #myIframe{
  height: 98%;
  width: 1200px;
  border: none;
}
        .datagrid table { 
    border-collapse: collapse;
    text-align: left; width: 100%; 
} 
.datagrid {font: normal 12px/150% Arial, Helvetica, sans-serif; 
          background: #fff; overflow: hidden; -webkit-border-radius: 3px;
          -moz-border-radius: 3px; 
          border-radius: 3px;
}
.datagrid table td, 
.datagrid table th { padding: 3px 10px 6px;

}
.datagrid table thead th {

 font-size: 12px; 
} 
.datagrid table thead th:first-child { border: none; }
.datagrid table tbody td { 
    color: #00557F;
    border-left: 1px solid #E1EEF4;
    font-size: 11px;font-weight: normal;
}
</style>
<script>
    function closeDialogSearch(){
         $("#dialogSearch").dialog("close");
    }
    function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    $(document).ready(function(){
         $("#close").click(function(){
            $('#dialog').dialog('close');             
            });
        $("#dialog").dialog({
             autoOpen: false,
             modal: true,
             height: 600,
             });
        var id="";
        
$('#search').click(function(){
        var brand=$("#brand").val();        
        var begin=$("#begin").val().replace(/\./g, '-');
        var end=$("#end").val().replace(/\./g, '-');
        var opt=$("#opt").val();
        $("#myIframe").attr('src', 'finish/detailSearch.jsp?begin='+begin+"&end="+end+"&brand="+brand+"&opt="+opt);
        $('#dialog').dialog('open');
        closeDialogSearch();
});
       
        $.getJSON("jsonData/jsonBrand.jsp",function(data){
    $.each(data,function(index,item) 
    {
      brand+="<option value='"+item.id+"'>"+item.name+"</option>";
    });
    $("#brand").html(brand); 
       
  });
        
        
        $("#remove").click(function(){
            $("#dialogRemove").dialog("open");  
        });
        $("#doneRemove").click(function(){
          $.ajax({
               data:"id="+id,
               url:"finish/remove.jsp",
               success:function(){ 
                        closeDialog(); 
                        RefreshTable("#example","finish/json.jsp");
                        
           }
               });
          
             
    });
       var table= $("#example").dataTable({
            "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
                        
		],
        "sPaginationType": "full_numbers",
        ajax: "finish/json.jsp"
        });
        $('#example tbody').on( 'click', 'tr', function () {              
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        id= $("#example").dataTable().fnGetData( this, 1 );
						//alert(id)
                       		}
	} ); 
        
        
        $("#searchData").click(function(){
            begin=$("#begin").val();
            end=$("#end").val();
            brand=$("#brand").val();
            opt=$("#opt").val();
            
            $("#dialogSearch").dialog("open");
            
        });
    });
</script>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Finish</a></li>
    <li><a href="#">Finish Goods</a></li>
</ul> 
 <hr class="thin bg-grayLighter">
 <!-- Dialog iframe-->
 <div id="dialog">
    <input type="submit" value="x" style="float: right;border:none" id="close"/>
    
    <!-- iframe-->
    <iframe id="myIframe" >
       
    
    </iframe>
   
</div>
 
 
  <div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="doneRemove" >OK</button>&nbsp; <button class="button default" id="cancel" onclick="closeDialog()">Cancel</button>
     </div>
 
<div data-role="dialog" id="dialogSearch" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Start Date </label><br>
         <div class="input-control text full-size" data-role="datepicker">
             <input type="text" id="begin" style="width: 700px">
        <button class="button"><span class="mif-calendar"></span></button>
         </div><br>
         <label>End Date</label><br>
         <div class="input-control text full-size" data-role="datepicker">
        <input type="text" id="end">
        <button class="button"><span class="mif-calendar"></span></button>
    </div>
         <label>Option</label><br>
           <div class="input-control text full-size" >
                    <select id="opt">
                        <option value="0">WHITE</option>
                        <option value="1">PASTA</option>
                        <option value="2">INK DIGITAL</option>
                        
                    </select>
               
    </div>
          <label>Brand</label><br>
         <div class="input-control text full-size" >
                    <select id="brand">
                       
                    </select>
               
    </div>
         <br><br>
         
         <button class="button primary" id="search" >OK</button>&nbsp; <button class="button default" id="cancel" onclick="closeDialogSearch()">Cancel</button>
     </div> 
   <button class="button warning" id="searchData" >Detail View</button>&nbsp; <button class="button alert" id="remove" >Remove</button>
<div class="datagrid">
    
<table class="table border bordered condensed" id="example">
    
    <thead>
                   
        <tr style="height: 35px">
                                                <th>NO</th>
                                                <th>ID</th>
                                                <th>DATE</th>
                                                <th>ITEM CODE</th>
                                                <th>MOTIF</th>
                                                <th>BRAND</th>
                                                <th>BODY</th>
                                                <th>ALUMINA</th>
                                                <th>ENGOBE</th>
                                                <th>GLAZE</th>
                                                <th>DROP</th>
                                                <th>PASTA</th>
                                                <th>ROLLER</th>
                                                <th>INK</th>
                                                <th>TOTAL</th>
    </tr>

    </thead>
    <tbody>
                                                    
    </tbody>
    
</table>

</div>