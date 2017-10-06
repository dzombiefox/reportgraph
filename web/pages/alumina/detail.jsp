<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<style>
   table { 
		width: 100%; 
		border-collapse: collapse; 
                font-family: tahoma;
                font-size: 10px;
	}
	
/* Zebra striping */
	tr:nth-of-type(odd) { 
		background: #eee; 
	}
	
th { 
		background: #333; 
		color: white; 
		font-weight: bold; 
	}

	td, th { 
		padding: 6px; 
		border: 1px solid #ccc; 
		text-align: left; 
	}
</style>
<style>
    #detail {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	
}
</style>
<body>
    <br>
    <table  id="detail" class=" table-bordered table-condensed " style="width: 98%" align="center">
    <tr>
    <th>Item Name</th>
    <th>Price(Rp/Kg)</th>
    <th>Volume %</th>
    <th>Price (Rp)</th>
    </tr>
    <%
    connect c=new connect();
    String id=request.getParameter("id");
    String query="select * from aluminaDetail join items on aluminaDetail.items_id=items.items_id where detail_id='"+id+"'";
    ResultSet rs=c.GetData(query);
    while(rs.next()){%>
     <tr>
    <td>
        <% out.print(rs.getString("items_name"));%>
    </td>
    <td>
        <% out.print(rs.getString("aluminaDetail_priceWet"));%>
    </td>
   
    <td class="volume" >
        <% out.print(rs.getString("aluminaDetail_volume"));%>
    </td>
    <td class="total">
        <% out.print(rs.getString("aluminaDetail_price"));%>
    </td>
       </tr> 
        
    <%  
    }
       String data="select * from alumina join weight on alumina.id_weight=weight.id_weight where alumina.detail_id='"+id+"'";
       ResultSet rsl=c.GetData(data);
       rsl.next();
       out.print("<tr><td colspan=2>Amount</td><td >"+rsl.getString("alumina_amountValue")+"</td><td>"+rsl.getString("alumina_amountPrice")+"</td></tr>");
       out.print("<tr><td colspan=2>Average</td><td colspan=2 align=center>"+rsl.getString("alumina_average")+"</td></tr>");
       out.print("<tr><td colspan=2>Size</td><td colspan=2 align=center>"+rsl.getString("size_items")+"</td></tr>");
       out.print("<tr><td colspan=2>Weight / Pcs</td><td colspan=2 align=center>"+rsl.getString("alumina_weight")+"</td></tr>");
       out.print("<tr><td colspan=2>Weight (Dry) Kg/M&sup2;</td><td colspan=2 align=center>"+rsl.getString("alumina_weightDry")+"</td></tr>");
       out.print("<tr><td colspan=2>Cost (Dry) </td><td colspan=2 align=center>"+rsl.getString("alumina_costDry")+"</td></tr>");
    %>
   
        
    
</table>

</body>