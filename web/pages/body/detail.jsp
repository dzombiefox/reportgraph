<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
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
    <th>Price Wet(Rp/Kg)</th>
    <th>Maximum H20</th>
    <th>Price Dry(Rp/Kg)</th>
    <th>Volume</th>
    <th>Price (Rp)</th>
    </tr>
    <%
    connect c=new connect();
    String id=request.getParameter("id");
    String query="select * from bodyDetail join items on bodyDetail.items_id=items.items_id where detail_id='"+id+"'";
    ResultSet rs=c.GetData(query);
    while(rs.next()){%>
     <tr>
    <td>
        <% out.print(rs.getString("items_name"));%>
    </td>
    <td>
        <% out.print(rs.getString("bodyDetail_priceWet"));%>
    </td>
    <td>
        <% out.print(rs.getString("bodyDetail_maxVolume"));%>%
    </td>
    <td>
        <% out.print(rs.getString("bodyDetail_priceDry"));%>
    </td>
    <td class="volume" >
        <% out.print(rs.getString("bodyDetail_volume"));%>
    </td>
    <td class="total">
        <% out.print(rs.getString("bodyDetail_price"));%>
    </td>
       </tr> 
        
    <%  
    }
       String data="select * from body join weight on body.id_weight=weight.id_weight where body.detail_id='"+id+"'";
       ResultSet rsl=c.GetData(data);
       rsl.next();
       out.print("<tr><td colspan=4>Amount</td><td >"+rsl.getString("body_amountValue")+"</td><td>"+rsl.getString("body_amountPrice")+"</td></tr>");
       out.print("<tr><td colspan=4>Average</td><td colspan=2 align=center>"+rsl.getString("body_average")+"</td></tr>");
       out.print("<tr><td colspan=4>Size</td><td colspan=2 align=center>"+rsl.getString("size_items")+"</td></tr>");
       out.print("<tr><td colspan=4>Weight / Pcs</td><td colspan=2 align=center>"+rsl.getString("body_weightPcs")+"</td></tr>");
       out.print("<tr><td colspan=4>Weight (Dry) Kg/M&sup2;</td><td colspan=2 align=center>"+rsl.getString("body_weightDry")+"</td></tr>");
       out.print("<tr><td colspan=4>Cost (Dry) </td><td colspan=2 align=center>"+rsl.getString("body_costDry")+"</td></tr>");
    %>
   
        
    
</table>

</body>