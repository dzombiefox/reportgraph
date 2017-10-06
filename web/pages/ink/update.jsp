<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="config.connect"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%    
connect c=new connect();
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
Date date = new Date();
String tanggal=dateFormat.format(date);
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String iDetail=jsonObj.get("detailId").toString();
String id=jsonObj.get("idInk").toString();
String name=jsonObj.get("name").toString();
String totalPrice=jsonObj.get("totalPrice").toString();
String periode=jsonObj.get("periode").toString();
String totalVolume=jsonObj.get("totalVolume").toString();
String size=jsonObj.get("size").toString();
String line=jsonObj.get("det").toString();
String color=jsonObj.get("color").toString();
String rw=jsonObj.get("row").toString();
int row=Integer.parseInt(rw);
String update ="update ink set ink_name='"+name+"',periode='"+periode+"',ink_amountPrice='"+totalPrice+"',ink_amountVolume='"+totalVolume+"',line_id='"+line+"',color_id='"+color+"',id_weight='"+size+"' where ink_id='"+id+"'";
c.ManipulasiData(update);



for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String idDetail=fr.get("id").toString();
String wet=fr.get("wet").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String u="update inkDetail set inkDetail_price='"+wet+"',inkDetail_volume='"+volume+"',inkDetail_totalPrice='"+harga+"',periode='"+periode+"' where inkDetail.items_id='"+idDetail+"'  and detail_id='"+id+"'";
c.ManipulasiData(u);


}

%>