<%@page import="config.connect"%>
<%
connect c=new connect();
String name=request.getParameter("name");
String query="insert into motif(motif_name)values('"+name+"')";
c.ManipulasiData(query);
%>
