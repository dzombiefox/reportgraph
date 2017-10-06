<script>
    function closeDialog(){
         $("#dialogRemove").dialog("close");
    }
    function openDialog(){
         $("#dialogRemove").dialog("open");  
    }  
   $(document).ready(function(){ 
    $("#detail").attr("disabled","disabled");
    $("#remove").attr("disabled","disabled");
           var id;
           var table=$("#example").dataTable({
             "columnDefs": [ 
			{
				"targets": [ 1 ],
				"visible": false,
				"searchable": true
			}
			
		],
        "sPaginationType": "full_numbers",
        ajax: "pasta/json.jsp"
        });
        $("#doneRemove").click(function(){
            $.ajax({
                url:"pasta/remove.jsp",
                data:"id="+id,
                success:function(){
                     RefreshTable("#example","pasta/json.jsp");
                     closeDialog();
                }
            });
            
        });
         $("#close").click(function(){
            $('#dialog').dialog('close');
             $("#detail").attr("disabled","disabled");
            });
            
            
            $("#dialog").dialog({
             autoOpen: false,
             modal: true,
             height: 600,
  
   
});

$('#detail').click(function(){
    $("#myIframe").attr('src', 'pasta/detailPasta.jsp?id='+id);
    $('#dialog').dialog('open');
});

$('#example tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');                       
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
                        id=($("#example").dataTable().fnGetData( this, 1 ));    
                        $("#detail").removeAttr("disabled");
                        $("#remove").removeAttr("disabled");
                   }
	} );

    });
</script>

<body>

						
                           <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Pasta</a></li>
    <li><a href="#">Data Pasta</a></li>
</ul>
				
			
<hr class="thin bg-grayLighter"> 
<div data-role="dialog" id="dialogRemove" class="padding20" data-close-button="true" data-overlay="true" data-overlay-color="op-dark" style="width: 300px">
         <br><label>Sure remove this item ??</label><br><br>
         <button class="button primary" id="doneRemove" >OK</button>&nbsp; <button class="button default" id="cancel" onclick="closeDialog()">Cancel</button>
</div>
<table width="25%" >
        <tr>
            <td width="125px">
                <input id="detail" type="submit" value="detail" style="width: 98%" class="open-dialog button success"/>
                 
            </td>
            <td width="120px">
                <input type="submit" id="remove" class="button alert" style="width: 98%" value="Remove" onclick="openDialog()"/>
           
            </td>
            
            
        </tr>
    </table>
   <div id="dialog">
    <input type="submit" value="x" style="float: right;border:none" id="close"/>
    
    <!-- iframe-->
    <iframe id="myIframe" >
       
    
    </iframe>
   
</div>

<table id="example" class="table  condensed border bordered dataTable" cellspacing="0" width="100%">
        <thead>
            <tr>
						<th>NO</th>
                                                <th>Detail ID</th>
						<th>Date</th>
						<th>Periode</th>
						<th>Name</th>
						<th>Size</th>
                                                <th>Weight / Pcs</th>
                                                <th>Color</th>
                                                <th>Pasta</th>
                                               
            </tr>
        </thead>   
<tbody>
</tbody>
    </table>
    
</body>