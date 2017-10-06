<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from report where report_id='"+id+"'";
c.ManipulasiData(query);
%>