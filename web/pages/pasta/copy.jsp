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
String cekId="select isnull(max(pasta_id)+0,0) as id from pasta";
ResultSet rs=c.GetData(cekId);
rs.next();
String lk=rs.getString("id");
int detailId=Integer.parseInt(lk)+1;
String jsonString = request.getParameter("data");
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String motif=jsonObj.get("motif").toString();
String totalPrice=jsonObj.get("totalPrice").toString();
String weight=jsonObj.get("weight").toString();
String periode=jsonObj.get("periode").toString();
String average=jsonObj.get("average").toString();
String weightdry=jsonObj.get("weightdry").toString();
String totalVolume=jsonObj.get("totalVolume").toString();
String costdry=jsonObj.get("costdry").toString();
String size=jsonObj.get("size").toString();
String opt=jsonObj.get("det").toString();
String color=jsonObj.get("color").toString();
String rw=jsonObj.get("row").toString();
int row=Integer.parseInt(rw);
String save="insert into pasta(detail_id,motif_id,id_weight,pasta_date,pasta_amountPrice,pasta_amountVolume,pasta_average,pasta_weightWet,pasta_weightDry,pasta_costDry,color_id,pasta_option,pasta_status,periode)values('"+detailId+"','"+motif+"','"+size+"','"+tanggal+"','"+totalPrice+"','"+totalVolume+"','"+average+"','"+weight+"','"+weightdry+"','"+costdry+"','"+color+"','"+opt+"',0,'"+periode+"')";
c.ManipulasiData(save);
for(int i=0;i<=row;i++){
JSONArray ar= (JSONArray) jsonObj.get("details");
JSONObject fr = (JSONObject) ar.get(i);
String id=fr.get("id").toString();
String wet=fr.get("wet").toString();
String volume=fr.get("volume").toString();
String harga=fr.get("harga").toString();
String sdetail="insert into pastaDetail(detail_id,items_id,pastaDetail_priceWet,pastaDetail_volume,pastaDetail_price,periode)values('"+detailId+"','"+id+"','"+wet+"','"+volume+"','"+harga+"','"+periode+"')";
c.ManipulasiData(sdetail);
}
%> 