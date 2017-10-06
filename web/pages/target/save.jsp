<%@page import="config.connect"%>
<%
connect c=new connect();
String line=request.getParameter("line");
String type=request.getParameter("type");
String size=request.getParameter("size");
String sch=request.getParameter("sch");
String kw1=request.getParameter("kw1");
String kw2=request.getParameter("kw2");
String kw3=request.getParameter("kw3");
String kw4=request.getParameter("kw4");
String kw5=request.getParameter("kw5");
String query="insert into persen (size_id,line_id,type_id,sch,pkw1,pkw2,pkw3,pkw4,pkw5)values('"+size+"','"+line+"','"+type+"','"+sch+"','"+kw1+"','"+kw2+"','"+kw3+"','"+kw4+"','"+kw5+"')";
c.ManipulasiData(query);
%>