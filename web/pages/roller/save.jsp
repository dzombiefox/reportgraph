<%@page import="config.connect"%>
<%
connect c=new connect();
String cd=request.getParameter("cd");
String nm=request.getParameter("nm");
String sc=request.getParameter("sc");
String st=request.getParameter("st");
String it=request.getParameter("it");
String pt=request.getParameter("pt");
String prp=request.getParameter("prp");
String mtv=request.getParameter("mtv");
String q="insert into mroller(code,name,motif,subCode,status,life,price,priceCalc)values('"+cd+"','"+nm+"','"+mtv+"','"+sc+"','"+st+"','"+it+"','"+pt+"','"+prp+"')";
c.ManipulasiData(q);
%>