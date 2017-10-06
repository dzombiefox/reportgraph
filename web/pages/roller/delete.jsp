<%@page import="config.connect" %>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from mroller where mroller_id='"+id+"'";
c.ManipulasiData(query);
%>
