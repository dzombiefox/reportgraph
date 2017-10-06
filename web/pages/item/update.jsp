<%@page import="java.sql.Connection"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
String id=request.getParameter("id"); 
String code=request.getParameter("kode"); 
String name=request.getParameter("nama");
String desc=request.getParameter("desc");
String color=request.getParameter("color");
String recent=request.getParameter("recent");
String volume=request.getParameter("volume");
int idNya=Integer.parseInt(id);
cs=con.prepareCall("call editItem(?,?,?,?,?,?,?)");
cs.setInt(1, idNya);
cs.setString(2, code);
cs.setString(3, desc);
cs.setString(4, color);
cs.setString(5, recent);
cs.setString(6, volume);
cs.setString(7, name);
cs.execute();
%>