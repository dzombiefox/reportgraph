<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String id=request.getParameter("id");
String name=request.getParameter("nm");
String type=request.getParameter("ty");
cs=con.prepareCall("call editType(?,?,?)");
cs.setString(1, id);
cs.setString(2, name);
cs.setString(3, type);
cs.execute();
%>