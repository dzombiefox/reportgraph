<%@page import="config.md5"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
md5 sec=new md5();
String username=request.getParameter("user").toLowerCase();
String password=request.getParameter("password").toLowerCase();
String query="select * from users where username='"+username+"'";
ResultSet rs=c.GetData(query);
if(rs.next()){
String id=rs.getString("user_id");
String nama=rs.getString("username").toLowerCase();
String pasw=rs.getString("password").toLowerCase();
String level=rs.getString("lev");
String pass=sec.md5(password);
if(pasw.equals(pass)){
 session.setAttribute("id",id);
 session.setAttribute("nama",nama);
 session.setAttribute("level",level);
 out.print("1");
}
else{
out.print("0");
}
}
else{
out.print("0");
}
//out.print(username);

%>