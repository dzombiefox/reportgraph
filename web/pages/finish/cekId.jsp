<%@page import="formula.finish"%>
<%
finish f=new finish();
int id=f.getDetailId();
out.print(id);
%>