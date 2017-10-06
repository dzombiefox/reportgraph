<%@page import="formula.drop"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="formula.alumina"%>
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
drop a=new drop();
NumberFormat nf=NumberFormat.getInstance();
int id=Integer.parseInt(request.getParameter("id"));
String query="select  b.drop_id,b.detail_id,b.name,b.date,b.weight,s.size,p.periode from drops b JOIN SIZE s on b.size_id=s.size_id join periode p on b.periode=p.id  where detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();
String date=rs.getString("date");
String name=rs.getString("name");
String size=rs.getString("size");
String periode=rs.getString("periode");
String weight=rs.getString("weight");
int dr=rs.getInt("drop_id");
%>
<br>
 <ul class="breadcrumbs">
    <li><a href="#"><span class="icon mif-home"></span></a></li>
    <li><a href="#">Home</a></li>
    <li><a href="#">Detail</a></li>
    <li><a href="#">Detail Formula Drop</a></li>
</ul> 
<div class="example" data-text="Detail Formula Alumina"  style="margin-left: 30px">
    
    <table class="table-bordered table table-condensed" border="1" >
        <tr>
            <th>ITEMS</th>
            <th>PRICE </th>
            <th>VOLUME</th>
            <th>IDR RP</th>
        </tr>
        <% 
String qu="select * from dropDetail b join items i on b.items_id=i.items_id  where detail_id='"+id+"'";
ResultSet rst=c.GetData(qu);
while(rst.next()){
        
        %>
<tr>
    <td><% out.print(rst.getString("items_desc"));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("priceWet")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("volume")));%></td>
    <td align="right"><% out.print(nf.format(rst.getDouble("price")));%></td>
</tr><%}%>
<tr>
    <td colspan="2">Amount</td>  
    <td align="right"><% out.print(nf.format(a.getAmountValue(id))); %></td>
    <td align="right"><% out.print(nf.format(a.getAmountPrice(id))); %></td>
</tr> 
<tr>
    <td colspan="2">Average</td>      
    <td align="center" colspan="2"><% out.print(nf.format(a.getAverage(id))); %></td>
</tr> 
<tr>
    <td colspan="2" >Weight(Wet)</td> 
    <td colspan="2" align="center"><%=weight%></td>
</tr> 
<tr>
    <td colspan="2" >Weight(Dry)</td>      
    <td colspan="2" align="center"><% out.print(nf.format(a.getweightDry(id)));%></td>
</tr> 
<tr>
    <td colspan="2" >Weight(Dry)</td>      
    <td colspan="2" align="center"><% out.print(nf.format(a.getCostDry(id)));%></td>
</tr>
    </table>
    
    
    
</div>
