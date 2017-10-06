<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();

String size=request.getParameter("size");
String query="select * from formula where size_id='"+size+"' and data_id='2' AND status='basah'";
ResultSet rs=c.GetData(query);
if(rs.next()){
String g=rs.getString("value");

out.print(g);}
else{
out.print(0);
}

%>