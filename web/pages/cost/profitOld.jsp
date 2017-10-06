<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="config.koma"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<table class="condensed border bordered dataTable"  data-auto-width="false" id="example">
    
    <thead>
        <tr>
    <th>No</th>
    <th>Date</th>
    <th>Item Code</th>
    <th>Line</th>
    <th>Hpp 1</th>
    <th>Hpp 2</th>
    <th>Hpp 3</th>
    <th>Hpp 4</th>
    <th>Hpp 5</th>
    <th>Sell 1</th>
    <th>Sell 2</th>
    <th>Sell 3</th>
    <th>Sell 4</th>
    <th>Sell 5</th>
    <th>Qty Sch</th>
    <th>Qty Real</th>
    <th>Val Sch</th>
    <th>Val Real</th>
    <th>Pro Sch</th>
    <th>Pro Real</th>
    </tr>
    </thead>


    <tbody>
        <%
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Disposition", "inline; filename="+ "profitreportOld.xls");
            koma k=new koma();
connect c=new connect();
String query="select  r.*,l.*,(r.sch*hpp_qty1)/1000000 as valSch,((r.kw1*r.hpp_qty1)+(r.kw2*r.hpp_qty2)+(r.kw3*r.hpp_qty3)+(r.kw4*r.hpp_qty4)+(r.kw5*r.hpp_qty5))/1000000 as valreal,r.sch*(r.sell_qty1-r.hpp_qty1)/1000000 as proSch,((r.kw1*(r.sell_qty1-r.hpp_qty1))+(r.kw2*(r.sell_qty2-r.hpp_qty2))+(r.kw3*(r.sell_qty3-r.hpp_qty3))+(r.kw4*(r.sell_qty4-r.hpp_qty4))+(r.kw5*(r.sell_qty5-r.hpp_qty5)))/1000000 as proReal from reportOld r join line l on r.line_id=l.line_id";
ResultSet rs=c.GetData(query);
int no=0;
while(rs.next()){
  String date=rs.getString("date");
  String itemCode=rs.getString("item_code");
  String line=rs.getString("line_name");
  Double kw1=rs.getDouble("kw1");
  Double kw2=rs.getDouble("kw2");
  Double kw3=rs.getDouble("kw3");
  Double kw4=rs.getDouble("kw4");
  Double kw5=rs.getDouble("kw5");
  Double totalKw=kw1+kw2+kw3+kw4+kw5;
  String hpp1=k.getBehind(rs.getDouble("hpp_qty1"));
  String hpp2=k.getBehind(rs.getDouble("hpp_qty2"));
  String hpp3=k.getBehind(rs.getDouble("hpp_qty3"));
  String hpp4=k.getBehind(rs.getDouble("hpp_qty4"));
  String hpp5=k.getBehind(rs.getDouble("hpp_qty5"));
  String sell1=k.getBehind(rs.getDouble("hpp_qty1"));
  String sell2=k.getBehind(rs.getDouble("sell_qty2"));
  String sell3=k.getBehind(rs.getDouble("sell_qty3"));
  String sell4=k.getBehind(rs.getDouble("sell_qty4"));
  String sell5=k.getBehind(rs.getDouble("sell_qty5"));
  
  String qtySch=k.getBehind(rs.getDouble("sch"));
  String qtyReal=k.getBehind(totalKw);
  
  
  String valSch=k.getBehind(rs.getDouble("valsch"));
  String valReal=k.getBehind(rs.getDouble("valreal"));
  String proSch=k.getBehind(rs.getDouble("proSch"));
  String proReal=k.getBehind(rs.getDouble("proReal"));
  no++;
%>
        <tr>
    <td><%=no%></td>
    <td><%=date%></td>
    <td><%=itemCode%></td>
    <td><%=line%></td>
    <td><%=hpp1%></td>
    <td><%=hpp2%></td>
    <td><%=hpp3%></td>
    <td><%=hpp4%></td>
    <td><%=hpp5%></td>
    <td><%=sell1%></td>
    <td><%=sell2%></td>
    <td><%=sell3%></td>
    <td><%=sell4%></td>
    <td><%=sell5%></td>
    <td><%=qtySch%></td>
    <td><%=qtyReal%></td>
    <td><%=valSch%></td>
    <td><%=valReal%></td>
    <td><%=proSch%></td>
    <td><%=proReal%></td>
    </tr>
  <%}%>
    </tbody>

</table>


