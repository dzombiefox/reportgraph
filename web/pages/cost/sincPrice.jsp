<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
    connect c=new connect();
//String bulan=request.getParameter("bulan");
String query="select r.item_code, r.hpp_qty1,r.hpp_qty2,r.hpp_qty3,r.hpp_qty4,r.hpp_qty5,r.sell_qty1,r.sell_qty2,r.sell_qty3,r.sell_qty4,r.sell_qty5 ,p.hpp_kw1,p.hpp_kw2,p.hpp_kw3,p.hpp_kw4,p.hpp_kw5,p.sell_kw1,p.sell_kw2,p.sell_kw3,p.sell_kw4,p.sell_kw5 from reportoLD r join price p on r.item_code=p.item_code where DATEPART(mm,r.date) ='11'";
ResultSet rs=c.GetData(query);
while(rs.next()){
String hpp1=rs.getString("hpp_kw1");
String hpp2=rs.getString("hpp_kw2");
String hpp3=rs.getString("hpp_kw3");
String hpp4=rs.getString("hpp_kw4");
String hpp5=rs.getString("hpp_kw5");
String sell1=rs.getString("sell_kw1");
String sell2=rs.getString("sell_kw2");
String sell3=rs.getString("sell_kw3");
String sell4=rs.getString("sell_kw4");
String sell5=rs.getString("sell_kw5");
String item_code=rs.getString("item_code");
//out.print(item_code+"<br>");
String update="update reportOld set hpp_qty1='"+hpp1+"',hpp_qty2='"+hpp2+"',hpp_qty3='"+hpp3+"',hpp_qty4='"+hpp4+"',hpp_qty5='"+hpp5+"',sell_qty1='"+sell1+"',sell_qty2='"+sell2+"',sell_qty3='"+sell3+"',sell_qty4='"+sell4+"',sell_qty5='"+sell5+"' where item_code='"+item_code+"'  ";
c.ManipulasiData(update);
}
%>