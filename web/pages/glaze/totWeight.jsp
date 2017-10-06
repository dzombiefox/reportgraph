<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%@page import="config.koma"%>
<%
connect c=new connect();
String size=request.getParameter("size");
String q1="select quantity from weight where id_weight='"+size+"'";
ResultSet rs1=c.GetData(q1);
rs1.next();
String qty=rs1.getString("quantity");
String q2="select * from formula where formula_weight='"+size+"' and data_id='2' AND formula_status='kering'";
ResultSet rs2=c.GetData(q2);
rs2.next();
String g=rs2.getString("formula_value");
float r=Float.parseFloat(g)/1000; 
float i=Float.parseFloat(qty);
float v=r*i;
out.print(v);
%>
