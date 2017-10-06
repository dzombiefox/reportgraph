<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String size=request.getParameter("size");
String q="select * from formula join data on formula.data_id=data.data_id where data.name='BODY' AND formula.status='kering' and formula.size_id='"+size+"' ";
ResultSet rs=c.GetData(q);
if(rs.next()){
String x=rs.getString("value");
float s=Float.valueOf(x);
float z=s/1000;
out.print(z);
}
else{
out.print(0);
}
%>