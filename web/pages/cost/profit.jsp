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
            response.setHeader("Content-Disposition", "inline; filename="+ "profitreport.xls");
            koma k=new koma();
		String d1=request.getParameter("d1");
		String d2=request.getParameter("d2");
connect c=new connect();
String query="select s.*,p.*,c.*,l.*, ((c.sch*c.pkw1)+(c.sch*c.pkw2)+(c.sch*c.pkw3)+(c.sch*c.pkw4)+(c.sch*c.pkw5))/100 as qtysch , ((c.sch*CONVERT(DECIMAL(16,2),c.pkw1/100.0)*hpp_kw1)+(c.sch*CONVERT(DECIMAL(16,2),  c.pkw2/100.0)*hpp_kw2)+(c.sch*CONVERT(DECIMAL(16,2),c.pkw3/100.0)*hpp_kw3)+(c.sch*CONVERT(DECIMAL(16,2), c.pkw4/100.0)*hpp_kw4)+(c.sch*CONVERT(DECIMAL(16,2),c.pkw5/100.0)*hpp_kw5) )/1000000 as  valsch, ((s.kw1*hpp_kw1)+(s.kw2*hpp_kw2)+(s.kw3*hpp_kw3)+(s.kw4*hpp_kw4)+(s.kw5*hpp_kw5))/1000000 as valReal,((c.sch*CONVERT(decimal(16,2),c.pkw1/100.0)*(sell_kw1-hpp_kw1))+(c.sch*CONVERT(decimal(16,2),c.pkw2/100.0)*(sell_kw2-hpp_kw2))+(c.sch*CONVERT(decimal(16,2),c.pkw3/100.0)*(sell_kw3-hpp_kw3))+(c.sch*CONVERT(decimal(16,2),c.pkw4/100.0)*(sell_kw4-hpp_kw4))+(c.sch*CONVERT(decimal(16,2),c.pkw5/100.0)*(sell_kw5-hpp_kw5)))/1000000 as proSch,((s.kw1*(sell_kw1-hpp_kw1))+(s.kw2*(sell_kw2-hpp_kw2))+(s.kw3*(sell_kw3-hpp_kw3))+(s.kw4*(sell_kw4-hpp_kw4))+(s.kw5*(sell_kw5-hpp_kw5))+(s.kw6*(sell_kw6-hpp_kw6)))/1000000 as proReal from sch s join prices p on s.price_id=p.prices_id join persen c on p.persen_id=c.persen_id join line l on c.line_id=l.line_id where date between '"+d1+"' and '"+d2+"'";
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
  String hpp1=k.getBehind(rs.getDouble("hpp_kw1"));
  String hpp2=k.getBehind(rs.getDouble("hpp_kw2"));
  String hpp3=k.getBehind(rs.getDouble("hpp_kw3"));
  String hpp4=k.getBehind(rs.getDouble("hpp_kw4"));
  String hpp5=k.getBehind(rs.getDouble("hpp_kw5"));
  String sell1=k.getBehind(rs.getDouble("sell_kw1"));
  String sell2=k.getBehind(rs.getDouble("sell_kw2"));
  String sell3=k.getBehind(rs.getDouble("sell_kw3"));
  String sell4=k.getBehind(rs.getDouble("sell_kw4"));
  String sell5=k.getBehind(rs.getDouble("sell_kw5"));
  String qtySch=k.getBehind(rs.getDouble("qtysch"));
  String qtyReal=k.getBehind(totalKw);
  String valSch=k.getBehind(rs.getDouble("valsch"));
  String valReal=k.getBehind(rs.getDouble("valReal"));
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


