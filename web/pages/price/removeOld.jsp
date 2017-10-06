<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String query="delete from priceOld where price_id='"+id+"'";
c.ManipulasiData(query);
%>