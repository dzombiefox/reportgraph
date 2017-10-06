<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String code=request.getParameter("code");
String name=request.getParameter("name");
String type=request.getParameter("type");
String brand=request.getParameter("brand");
String option=request.getParameter("option");
cs=con.prepareCall("call saveMotif(?,?,?,?,?)");
cs.setString(1, name);
cs.setString(2, type);
cs.setString(3, brand);
cs.setString(4, option);
cs.setString(5, code);
cs.execute();
%>