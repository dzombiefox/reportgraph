<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("id");
String line=request.getParameter("line");
String type=request.getParameter("type");
String size=request.getParameter("size");
String sch=request.getParameter("sch");
String kw1=request.getParameter("kw1");
String kw2=request.getParameter("kw2");
String kw3=request.getParameter("kw3");
String kw4=request.getParameter("kw4");
String kw5=request.getParameter("kw5");
String update="update persen set size_id='"+size+"',line_id='"+line+"',type_id='"+type+"',sch='"+sch+"',pkw1='"+kw1+"',pkw2='"+kw2+"',pkw3='"+kw3+"',pkw4='"+kw4+"',pkw5='"+kw5+"' where persen_id='"+id+"' ";
c.ManipulasiData(update);
%>