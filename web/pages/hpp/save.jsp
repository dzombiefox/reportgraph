<%@page import="config.connect"%>
<%
connect c=new connect();
String brand=request.getParameter("brand");
String size=request.getParameter("size");
String cbox=request.getParameter("cbox");
String dlabour=request.getParameter("dlabour");
String ohead=request.getParameter("ohead");
String sdisc=request.getParameter("sdisc");
String opexp=request.getParameter("opexp");
String ccharge=request.getParameter("ccharge");
String pkw1=request.getParameter("pkw1");
String mexp=request.getParameter("mexp");
String hkw1=request.getParameter("hkw1");
String hkw2=request.getParameter("hkw2");
String hkw3=request.getParameter("hkw3");
String hkw4=request.getParameter("hkw4");
String hkw5=request.getParameter("hkw5");
String skw1=request.getParameter("skw1");
String skw2=request.getParameter("skw2");
String skw3=request.getParameter("skw3");
String skw4=request.getParameter("skw4");
String skw5=request.getParameter("skw5");
String query="insert into prices(brand_id,size_id,cbox,dlabour,moverhead,sdisc,opexp,ccharge,pkw1,mexp,hpp_1,hpp_2,hpp_3,hpp_4,hpp_5,sell_1,sell_2,sell_3,sell_4,sell_5)values('"+brand+"','"+size+"','"+cbox+"','"+dlabour+"','"+ohead+"','"+sdisc+"','"+opexp+"','"+ccharge+"','"+pkw1+"','"+mexp+"','"+hkw1+"','"+hkw2+"','"+hkw3+"','"+hkw4+"','"+hkw5+"','"+skw1+"','"+skw2+"','"+skw3+"','"+skw4+"','"+skw5+"')";
c.ManipulasiData(query);

out.print(hkw4);

%>