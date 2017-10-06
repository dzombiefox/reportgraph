

<script>
    $(document).ready(function(){
        var oTable = $('#example').dataTable();

$("a").click(function() {
    $(oTable).dataTable().fnAddData(["test","ok"]);
    $(oTable).find('td').editable();
});
        
    });
    
</script>
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
<thead>
    <tr><th>Main</th></tr>                
</thead>
<tbody>
 <tr><td>Main</td></tr>           
</tbody>
</table>
<br/>
<br/>
<br/>
<a>click to add row</a>