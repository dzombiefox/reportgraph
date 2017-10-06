<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String id=request.getParameter("id");
cs=con.prepareCall("call deleteFormula(?)");
cs.setString(1, id);
cs.execute();

%>
