<%@page import="config.connect"%>
<%
    connect c=new connect();
String kode=request.getParameter("kode");
String q1="delete from purchase where no_po='"+kode+"'";
c.ManipulasiData(q1);
String q2="delete from total where no_po='"+kode+"'";
c.ManipulasiData(q2);
String q3="delete from detail_purchase where no_po='"+kode+"'";
c.ManipulasiData(q3);
%>
