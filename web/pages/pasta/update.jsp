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
String id=jsonObj.get("idPasta").toString();
String name=jsonObj.get("name").toString();
String color=jsonObj.get("color").toString();
String weight=jsonObj.get("weight").toString();
String periode=jsonObj.get("periode").toString();
String average=jsonObj.get("average").toString();
String weightdry=jsonObj.get("weightdry").toString();
String totalVolume=jsonObj.get("totalVolume").toString();
String totalPrice=jsonObj.get("totalPrice").toString();
String costdry=jsonObj.get("costdry").toString();
String option=jsonObj.get("option").toString();
String size=jsonObj.get("size").toString();
String rw=jsonObj.get("row").toString();
int row=Integer.parseInt(rw);
String que="update pasta set motif_id='"+name+"',color_id='"+color+"',id_weight='"+size+"',periode='"+periode+"',pasta_average='"+average+"',pasta_weightWet='"+weight+"',pasta_amountPrice='"+totalPrice+"',pasta_weightDry='"+weightdry+"',pasta_amountVolume='"+totalVolume+"',pasta_costDry='"+costdry+"',pasta_option='"+option+"' where pasta_id='"+id+"'";
c.ManipulasiData(que);
for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String idDetail=fr.get("id").toString();
String wet=fr.get("wet").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String update="update pastaDetail set pastaDetail_priceWet='"+wet+"',pastaDetail_volume='"+volume+"',pastaDetail_price='"+harga+"',periode='"+periode+"' where pastaDetail.items_id='"+idDetail+"'  and detail_id='"+id+"'";
c.ManipulasiData(update);
}

%>