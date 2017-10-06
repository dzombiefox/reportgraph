<%@page import="config.connect"%>
<%
connect c=new connect();
String po=request.getParameter("po");
String depo=request.getParameter("depo");
String sales=request.getParameter("sales");
String sell=request.getParameter("sell");
String update="update purchase set kci_depo='"+depo+"',sales_cost='"+sales+"',sell_box='"+sell+"' where purchase_id='"+po+"'";
c.ManipulasiData(update);


%>
