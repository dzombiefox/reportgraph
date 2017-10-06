<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String name=request.getParameter("name");
String size=request.getParameter("size");
String val=request.getParameter("val");
String sta=request.getParameter("sta");
cs=con.prepareCall("call saveFormula(?,?,?,?)");
cs.setString(1, name);
cs.setString(2, size);
cs.setString(3, sta);
cs.setString(4, val);
cs.execute();
%>