<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from pasta where detail_id='"+id+"'";
c.ManipulasiData(query);
String detail="delete from pastaDetail where detail_id='"+id+"'";
c.ManipulasiData(detail);
%>