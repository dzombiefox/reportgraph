<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%@page import="config.sincronize"%>
<%
sincronize s=new sincronize();
connect c=new connect();
String begin=request.getParameter("begin");
String end=request.getParameter("end");
String li=request.getParameter("line");
String query="delete  from cogs_report where  date between '"+begin+"' and '"+end+"' and line_id='"+li+"' ";
s.ManipulasiData(query);
String cek="select * from report where date between '"+begin+"' and '"+end+"' and line_id='"+li+"' ";
ResultSet rs=c.GetData(cek);
while(rs.next()){
    String date=rs.getString("date");
    String itemCode=rs.getString("item_code");
    String line=rs.getString("line_id");
    String sch=rs.getString("sch");
    String kw1=rs.getString("kw1");
    String kw2=rs.getString("kw2");
    String kw3=rs.getString("kw3");
    String kw4=rs.getString("kw4");
    String kw5=rs.getString("kw5");
    
    String hpp1=rs.getString("hpp_qty1");
    String hpp2=rs.getString("hpp_qty2");
    String hpp3=rs.getString("hpp_qty3");
    String hpp4=rs.getString("hpp_qty4");
    String hpp5=rs.getString("hpp_qty5");
    
    String sell1=rs.getString("sell_qty1");
    String sell2=rs.getString("sell_qty2");
    String sell3=rs.getString("sell_qty3");
    String sell4=rs.getString("sell_qty4");
    String sell5=rs.getString("sell_qty5");    
    String update="insert into cogs_report(date,item_code,line_id,sch,kw1,hpp_qty1,sell_qty1,kw2,hpp_qty2,sell_qty2,kw3,hpp_qty3,sell_qty3,kw4,hpp_qty4,sell_qty4,kw5,hpp_qty5,sell_qty5)values('"+date+"','"+itemCode+"','"+line+"','"+sch+"','"+kw1+"','"+hpp1+"','"+sell1+"','"+kw2+"','"+hpp2+"','"+sell2+"','"+kw3+"','"+hpp3+"','"+sell3+"','"+kw4+"','"+hpp4+"','"+sell4+"','"+kw5+"','"+hpp5+"','"+sell5+"')";
    s.ManipulasiData(update);
}
%>