<%@page import="java.text.NumberFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select * from bodyDetail join items on bodyDetail.items_id=items.items_id where bodyDetail.detail_id='"+id+"' and items_desc not like 'air%'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
NumberFormat nf= NumberFormat.getInstance();
while(rs.next()){
float v=rs.getFloat("volume");
float m=rs.getFloat("maxVolume");
String max=nf.format(m);
String volume =nf.format(v);
String[] value = {
rs.getString("items_id"),
rs.getString("items_code"),
rs.getString("items_desc"),
rs.getString("maxVolume"),
rs.getString("priceWet"),
rs.getString("priceDry"),
volume,
rs.getString("price"),
rs.getString("items_uprecent")
};
    String[] key = {
"id",
"code",
"desc",
"maxVolume",
"priceWet",
"priceDry",
"volume",
"total",
"uprecent"
};
 js.add(new pushData(key, value));
}
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();

out.print(jsons);

%>