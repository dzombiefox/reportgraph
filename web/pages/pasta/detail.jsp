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
    table th{
     font-size: 12px;   
    }
    table td{
        font-size: 10px;
    }
    body{
        background-color: white;
    }
</style><br>
<table class="table table-bordered table-condensed" style="width: 98%;padding-top: 10px" align="center">
    <thead>
    <tr>
        <th>
            Item Name
        </th>    
         <th>
            Price (Rp/Kg)
        </th>
        
        <th>
            Volume %
        </th>
        <th>
            Total Price
        </th>
    </tr>
    </thead>
    <tbody>
    <%
      
    connect c=new connect();
    String kode=request.getParameter("id");
    String query="select * from pastaDetail join items on pastaDetail.items_id=items.items_id where detail_id='"+kode+"' ";
    ResultSet rs=c.GetData(query);
    while(rs.next()){%>
    <tr>
        <td><%out.print(rs.getString("items_name")); %></td>    
        <td><%out.print(rs.getString("pastaDetail_priceWet")); %></td>
        <td><%out.print(rs.getString("pastaDetail_volume")); %></td>
        <td><%out.print(rs.getString("pastaDetail_price")); %></td>
    </tr>

        
    <%  
    }
       String data="select * from pasta join weight on pasta.id_weight=weight.id_weight where pasta.detail_id='"+kode+"'";
       ResultSet rsl=c.GetData(data);
       rsl.next();
       out.print("<tr><td colspan=2>Amount</td><td >"+rsl.getString("pasta_amountVolume")+"</td><td>"+rsl.getString("pasta_amountPrice")+"</td></tr>");
       out.print("<tr><td colspan=2>Average</td><td colspan=2 align=center>"+rsl.getString("pasta_average")+"</td></tr>");
       out.print("<tr><td colspan=2>Size</td><td colspan=2 align=center>"+rsl.getString("size_items")+"</td></tr>");
       out.print("<tr><td colspan=2>Weight / Pcs</td><td colspan=2 align=center>"+rsl.getString("pasta_weightWet")+"</td></tr>");
       out.print("<tr><td colspan=2>Weight (Dry) Kg/M&sup2;</td><td colspan=2 align=center>"+rsl.getString("pasta_weightDry")+"</td></tr>");
       out.print("<tr><td colspan=2>Cost (Dry) </td><td colspan=2 align=center>"+rsl.getString("pasta_costDry")+"</td></tr>");
    %>
    </tbody>
</table>

