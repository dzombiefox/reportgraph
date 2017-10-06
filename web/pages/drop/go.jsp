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
String query="SELECT * FROM dropDetail join items on dropDetail.items_id=items.items_id where dropDetail.detail_id='"+id+"'";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
NumberFormat nf= NumberFormat.getInstance();
while(rs.next()){
float volume=rs.getFloat("volume");
String vol =nf.format(volume);
    String[] value = {
    rs.getString("items_id"),
    rs.getString("items_code"),
    rs.getString("priceWet"),
    vol,
    rs.getString("price")
    };
    String[] key = {
        "id",
        "code",
        "priceWet",
        "volume",
        "price"
                   };
 js.add(new pushData(key, value));
}
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();
out.print(jsons);

%>