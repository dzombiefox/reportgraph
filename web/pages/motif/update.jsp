<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String id=request.getParameter("id");
String name=request.getParameter("nm");
String code=request.getParameter("code");
String type=request.getParameter("ty");
String brand=request.getParameter("brand");
String option=request.getParameter("option");
cs=con.prepareCall("call editMotif(?,?,?,?,?,?)");
cs.setString(1, id);
cs.setString(2, name);
cs.setString(3, type);
cs.setString(4, brand);
cs.setString(5, option);
cs.setString(6, code);
cs.execute();
%>