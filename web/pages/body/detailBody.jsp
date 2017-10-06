<%@page import="java.text.NumberFormat"%>
<%@page import="formula.body"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<script src="../../js/jquery-2.1.3.min.js" type="text/javascript"></script>
<link href="../../build/css/metro.css" rel="stylesheet" type="text/css"/>
<script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="../js/dataTables.tableTools.js" type="text/javascript"></script>
<style>
.example table td, 
.datagrid table th { padding: 2px 4px;
}  
.example table tr { 
height:16px;
}
.example table tbody td {  
//border-left: 1px solid #E1EEF4;
font-size: 16px;font-weight: normal;
}
</style>
<%
connect c=new connect();   
NumberFormat nf=NumberFormat.getInstance();
body b=new body();
int id=Integer.parseInt(request.getParameter("id"));
String query="select  b.name,b.choose,b.date,b.weightPcs,s.size,p.periode from body b JOIN SIZE s on b.size_id=s.size_id join periode p on b.periode=p.id where detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
String date=rs.getString("date");
String name=rs.getString("name");
String body=rs.getString("choose");
String size=rs.getString("size");
Double weight=rs.getDouble("weightPcs");
String periode=rs.getString("periode");

%>
<br>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Detail</a></li>
    <li><a href="#">Detail Formula Body</a></li>
</ul> 
<div class="example" data-text="Detail Formula Body"  style="margin-left: 30px">
    
    <table class="table-bordered table table-condensed" border="1" >
        <tr>
            <th>ITEMS</th>
            <th>PRICE WET</th>
            <th>MAX H20</th>
            <th>PRICE DRY</th>
            <th>VOLUME</th>
            <th>IDR RP</th>
        </tr>
        <% 
String qu="select * from bodyDetail b join items i on b.items_id=i.items_id where b.category=0 and detail_id='"+id+"'";
String que="select * from bodyDetail b join items i on b.items_id=i.items_id where b.category=1 and detail_id='"+id+"'";
ResultSet rque=c.GetData(que);
rque.next();
ResultSet rst=c.GetData(qu);
while(rst.next()){%>
<tr>
    <td><% out.print(rst.getString("items_desc"));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("priceWet")));%></td>
    <td align="right"><% out.print(rst.getString("maxVolume"));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("priceDry")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("volume")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("price")));%></td>
</tr>

        <%}%>
        <tr>
    <td colspan="4">Amount</td>
    <td align="right"><%
    out.print(nf.format(b.getAmountVolume(id)));
    %></td>
    <td align="right"><% out.print(nf.format(b.getAmountPrice(id)));%></td>
</tr>
<tr style="height: 3px">
    <td colspan="4" class='rapat'>Average</td>
    
    <td align="center" colspan="2"><% out.print(nf.format(b.getAverage(id)));%></td>
</tr>

<tr>
    <td >        
        <%
        out.print(rque.getString("items_desc"));
        %>
    </td>    
    <td align="right">
      <%
        out.print(rque.getString("priceWet"));
        %>  
    </td>
    <td align='right'>
        0%
    </td>
    <td align='right'>        
        <%
        out.print(rque.getString("price"));
        %>
    </td>
     <td align='right'>        
        <%
        out.print(rque.getString("volume"));
        %>
    </td>
     <td align='right'>        
        <%
        out.print(b.getroPrice(id));
        %>
    </td>
</tr>
<tr style="height: 3px">
    <td colspan="4" class='rapat'>Average</td>
    
    <td align="center" colspan="2"><% out.print(nf.format(b.getTotalAverage(id)));%></td>
</tr>
<tr>
    <td colspan="2">Size</td>
    <td></td>
    <td></td>
    <td colspan="2" align='center'><% out.print(rs.getString("size")); %></td>
</tr>
<tr>
    <td colspan="2">Weight /pcs</td>
    <td></td>
    <td></td>
    <td colspan="2" align='center'><% out.print(rs.getString("weightPcs")); %></td>
</tr>
<tr>
    <td colspan="2">Weight Dry</td>
    <td></td>
    <td></td>
    <td colspan="2" align='center'><% out.print(b.getweightDry(id)); %></td>
</tr>
<tr>
    <td colspan="2">Cost Dry</td>
    <td></td>
    <td></td>
    <td colspan="2" align='center'><% out.print(nf.format(b.getcostDry(id))); %></td>
</tr>
    </table>
    
    
    
</div>
