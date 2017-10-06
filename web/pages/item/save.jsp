<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="config.connect" %>
<%
connect c=new connect();
CallableStatement cs;
Connection con;
con=c.getKoneksi();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Calendar cal = Calendar.getInstance();
String tgl=(dateFormat.format(cal.getTime()));
String id=request.getParameter("id"); 
String code=request.getParameter("kode");  
String desc=request.getParameter("desc");
String color=request.getParameter("color");
String recent=request.getParameter("recent");
String volume=request.getParameter("h2o");
String nm=request.getParameter("nama");
cs=con.prepareCall("call saveItem(?,?,?,?,?,?,?,?)");
cs.setString(1, code);
cs.setString(2, desc);
cs.setString(3, color);
cs.setString(4, recent);
cs.setString(5, volume);
cs.setString(6, id);
cs.setString(7, tgl);
cs.setString(8, nm);
cs.execute();
%>
