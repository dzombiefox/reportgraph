<%@page import="config.connect" %>
<%
connect c=new connect();
String id=request.getParameter("id");
String code=request.getParameter("code");
String name=request.getParameter("name");
String sCode=request.getParameter("sCode");
String motiv=request.getParameter("motiv");
String status=request.getParameter("status");
String lTime=request.getParameter("lTime");
String price=request.getParameter("price");
String pPrint=request.getParameter("pPrint");
String q="update mroller set code='"+code+"',name='"+name+"',motif='"+motiv+"',subCode='"+sCode+"',status='"+status+"',life='"+lTime+"',price='"+price+"',priceCalc='"+pPrint+"'  where mroller_id='"+id+"'";
c.ManipulasiData(q);
%>
