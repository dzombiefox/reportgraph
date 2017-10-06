<%@page import="java.text.NumberFormat"%>
<%@page import="formula.ink"%>
<%@page import="formula.glaze"%>
<%@page import="formula.engobe"%>
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
ink i=new ink();
glaze g=new glaze();
NumberFormat nf=NumberFormat.getInstance();
int id=Integer.parseInt(request.getParameter("id"));
String query="SELECT i.detail_id,i.name,i.date,s.size,c.name as color,per.periode from ink i join size s on i.size_id=s.size_id join color c on i.color_id=c.color_id join periode per on i.periode=per.id  where detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
String date=rs.getString("date");
String name=rs.getString("name");
String size=rs.getString("size");
String periode=rs.getString("periode");
String color=rs.getString("color");

%>
<br>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Detail</a></li>
    <li><a href="#">Detail Formula Ink</a></li>
</ul> 
<div class="example" data-text="Detail Formula Ink"  style="margin-left: 30px">
    
    <table class="table-bordered table table-condensed" border="1" >
        <tr>
            <th>ITEMS</th>
            <th>PRICE </th>
            <th>VOLUME</th>
            <th>IDR RP</th>
        </tr>
        <% 
String qu="select * from inkDetail b join items i on b.items_id=i.items_id  where detail_id='"+id+"'";
ResultSet rst=c.GetData(qu);
while(rst.next()){%>
<tr>
    <td><% out.print(rst.getString("items_desc"));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("priceWet")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("volume")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("price")));%></td>
</tr><%}%>
<tr>
    <td colspan="2">Amount</td>  
    <td align="right"><% out.print(nf.format(i.getTotalValue(id))); %></td>
    <td align="right"><% out.print(nf.format(i.getTotalPrice(id))); %></td>
</tr> 
<tr>
    <td colspan="2">Size</td>  
    <td align="center" colspan="2"><% out.print(size); %></td>   
</tr> 
<tr>
    <td colspan="2">Size</td>  
    <td align="center" colspan="2"><% out.print(color); %></td>   
</tr> 
    </table>
    
    
    
</div>
