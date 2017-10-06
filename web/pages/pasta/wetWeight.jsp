<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String size=request.getParameter("size");
String weight=request.getParameter("weight");
String query="select quantity from weight where id_weight='"+size+"'";
ResultSet rs=c.GetData(query);
rs.next();
String g=rs.getString("quantity");
float x=Float.parseFloat(g);
float y=Float.parseFloat(weight);
float res=y*x/1000;
out.print(res);

%>