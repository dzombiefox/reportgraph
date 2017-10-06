<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String id=request.getParameter("id"); 
String name=request.getParameter("name");  
String size=request.getParameter("size");
String value=request.getParameter("value");
String status=request.getParameter("status");
cs=con.prepareCall("call editFormula(?,?,?,?,?)");
cs.setString(1, id);
cs.setString(2, name);
cs.setString(3, size);
cs.setString(4, value);
cs.setString(5, status);
cs.execute();
%>
