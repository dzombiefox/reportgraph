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
String exTahun=tanggal.substring(2,4 );
String exBulan=tanggal.substring(5,7 );

String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String iDetail=jsonObj.get("detailId").toString();
String id=jsonObj.get("idBody").toString();
String name=jsonObj.get("name").toString();
String costdry=jsonObj.get("costdry").toString();
String weightdry=jsonObj.get("weightdry").toString();
String weight=jsonObj.get("weight").toString();
String periode=jsonObj.get("periode").toString();
String average=jsonObj.get("average").toString();
String amountVolume=jsonObj.get("amountVolume").toString();
String amountPrice=jsonObj.get("amountPrice").toString();
String size=jsonObj.get("size").toString();
String rw=jsonObj.get("row").toString();
int row=Integer.parseInt(rw);
String cekId="select isnull(max(body_id)+0,0) as id from body";
ResultSet rs=c.GetData(cekId);
rs.next();
String lk=rs.getString("id");
int detailId=Integer.parseInt(lk)+1;

String que="update body set body_name='"+name+"',body_date='"+tanggal+"',body_amountPrice='"+amountPrice+"',body_amountValue='"+amountVolume+"',body_average='"+average+"',body_weightPcs='"+weight+"',id_weight='"+size+"',body_weightDry='"+weightdry+"',body_costDry='"+costdry+"',body_periode='"+periode+"' where body_id='"+id+"'";
c.ManipulasiData(que);

for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String idDetail=fr.get("id").toString();
String maks=fr.get("maks").toString();
String wet=fr.get("wet").toString();
String dry=fr.get("dry").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String update="update bodyDetail set bodyDetail_maxVolume='"+maks+"',bodyDetail_priceWet='"+wet+"',bodyDetail_priceDry='"+dry+"',bodyDetail_volume='"+volume+"',bodyDetail_price='"+harga+"',periode='"+periode+"' where bodyDetail.items_id='"+idDetail+"'  and detail_id='"+id+"'";
c.ManipulasiData(update);/*
String qu="insert into bodyDetail(detail_id,items_id,bodyDetail_maxVolume,bodyDetail_priceWet,bodyDetail_priceDry,bodyDetail_volume,bodyDetail_price,periode)values('"+detailId+"','"+id+"','"+maks+"','"+wet+"','"+dry+"','"+volume+"','"+harga+"','"+periode+"')";
c.ManipulasiData(qu);*/
}
out.print("ok");
%>