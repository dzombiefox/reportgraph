<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select * from engobeDetail join items on engobeDetail.items_id=items.items_id where engobeDetail.detail_id='"+id+"' and items_desc not like 'air%'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
    String[] value = {
        rs.getString("items_id"),
        rs.getString("items_code"),
        rs.getString("priceWet"),
        rs.getString("volume"),
        rs.getString("price"),
        rs.getString("items_uprecent"),
                     };
    String[] key = {
        "id",
        "code",
        "price",
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