<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="select * from body where detaiL_id='"+id+"'";
ResultSet rs=c.GetData(query);
rs.next();

%>