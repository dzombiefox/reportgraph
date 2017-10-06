<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String kode=request.getParameter("kode");
String detail=request.getParameter("detail");
String cek="select * from detail_purchase where no_po='"+kode+"' and category_id='"+detail+"'";
ResultSet rs=c.GetData(cek);
if(!rs.next()){
out.print(0);
}
else{
out.print(1);
}
%>