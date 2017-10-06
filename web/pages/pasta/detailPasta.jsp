<%@page import="java.text.NumberFormat"%>
<%@page import="formula.pasta"%>
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
pasta p=new pasta();
NumberFormat nf=NumberFormat.getInstance();
int id=Integer.parseInt(request.getParameter("id"));
String query="select p.size_id,p.detail_id,p.name,p.date,p.opt,p.weight,s.size,c.name as color ,per.periode as periode from pasta p join size s on p.size_id=s.size_id join color c on p.color_id=c.color_id join periode per on p.periode=per.id  where detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
String date=rs.getString("date");
String name=rs.getString("name");
int s=rs.getInt("size_id");
String size=rs.getString("size");
String periode=rs.getString("periode");
String color=rs.getString("color");
String opt=rs.getString("opt");
Double weight=rs.getDouble("weight");
%>
<br>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Detail</a></li>
    <li><a href="#">Detail Formula Pasta</a></li>
</ul> 
<div class="example" data-text="Detail Formula Pasta"  style="margin-left: 30px">
    
    <table class="table-bordered table table-condensed" border="1" >
        <tr>
            <th>ITEMS</th>
            <th>PRICE </th>
            <th>VOLUME</th>
            <th>IDR RP</th>
        </tr>
        <% 
String qu="select * from pastaDetail b join items i on b.items_id=i.items_id  where detail_id='"+id+"'";
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
    <td align="right"><% out.print(nf.format(p.getTotalValue(id))); %></td>
    <td align="right"><% out.print(nf.format(p.getTotalPrice(id))); %></td>
</tr> 
<tr>
    <td colspan="2">Average</td>  
    <td align="center" colspan="2"><% out.print(nf.format(p.getAverage(id))); %></td>
</tr> 
<tr>
    <td colspan="2">Size</td>  
    <td align="center" colspan="2"><% out.print(size); %></td>   
</tr> 

<tr>
    <td colspan="2">Weight G/P</td>  
    <td align="center" colspan="2"><% out.print(weight); %></td>
</tr>
<tr>
    <td colspan="2">Weight Dry kg/M&sup2;</td>  
    <td align="center" colspan="2"><% out.print(p.getDryWeight(id)); %></td>
</tr>
<tr>
    <td colspan="2">Cost Dry Rp/M&sup2;</td>  
    <td align="center" colspan="2"><% out.print(nf.format(p.getDoubleCostDry(id))); %></td>
</tr>
    </table>
    
    
    
</div>
