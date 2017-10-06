<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String cek="select * from purchase where no_po='"+kode+"' ";
ResultSet rs=c.GetData(cek);
if(!rs.next()){
out.print(0);
}
else{
out.print(1);
}
%>