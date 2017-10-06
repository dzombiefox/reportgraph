<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String name=request.getParameter("name");
String type=request.getParameter("type");
cs=con.prepareCall("call saveType(?,?)");
cs.setString(1, name);
cs.setString(2, type);
cs.execute();
%>