<%@page import="config.connect"%>
<%
String id=request.getParameter("id");
String query="update ink set ink_status='1' where detail_id='"+id+"'";
connect c=new connect();
c.ManipulasiData(query);

%>