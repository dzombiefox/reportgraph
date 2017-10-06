<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String query="select * from purchase where no_po='"+kode+"'";
ResultSet rs=c.GetData(query);
rs.next();
out.print(rs.getString("container"));
%>
