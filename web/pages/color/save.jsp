<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String name=request.getParameter("name");
cs=con.prepareCall("call saveColor(?)");
cs.setString(1, name);
cs.execute();
%>