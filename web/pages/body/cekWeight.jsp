<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String weight=request.getParameter("weight");
String size=request.getParameter("size");
String query="select * from size where size_id='"+size+"'";
ResultSet rs=c.GetData(query);
while(rs.next()){
int g=rs.getInt("quantity");
float s=Float.valueOf(weight);
float f=g*s;
out.print(f);
}
%>