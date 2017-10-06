<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String jsonString = request.getParameter("data");        
JSONObject jsonObj = (JSONObject)JSONValue.parse(request.getParameter("data"));
String name=jsonObj.get("nama").toString();     
String kode=jsonObj.get("kode").toString();
String motif=jsonObj.get("motif").toString();
String brand=jsonObj.get("brand").toString();
String target=jsonObj.get("target").toString();
String hpp1=jsonObj.get("hpp1").toString();
String hpp2=jsonObj.get("hpp2").toString();
String hpp3=jsonObj.get("hpp3").toString();
String hpp4=jsonObj.get("hpp4").toString();
String hpp5=jsonObj.get("hpp5").toString();
String hpp6=jsonObj.get("hpp6").toString();
String sell1=jsonObj.get("sell1").toString();
String sell2=jsonObj.get("sell2").toString();
String sell3=jsonObj.get("sell3").toString();
String sell4=jsonObj.get("sell4").toString();
String sell5=jsonObj.get("sell5").toString();
String sell6=jsonObj.get("sell6").toString();
String periode=jsonObj.get("periode").toString();
String tahun=jsonObj.get("tahun").toString();
String query="insert into prices(item_name,item_code,motif_id,brand_id,hpp_kw1,hpp_kw2,hpp_kw3,hpp_kw4,hpp_kw5,hpp_kw6,sell_kw1,sell_kw2,sell_kw3,sell_kw4,sell_kw5,sell_kw6,persen_id,periode,year)values('"+name+"','"+kode+"','"+motif+"','"+brand+"','"+hpp1+"','"+hpp2+"','"+hpp3+"','"+hpp4+"','"+hpp5+"','"+hpp6+"','"+sell1+"','"+sell2+"','"+sell3+"','"+sell4+"','"+sell5+"','"+sell6+"','"+target+"','"+periode+"','"+tahun+"')";
c.ManipulasiData(query);
%>
