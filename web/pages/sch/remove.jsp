<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String q1="delete from sch where sch_id='"+id+"'";
c.ManipulasiData(q1);
%>
