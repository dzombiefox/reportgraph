<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%
connect c=new connect();
String id=request.getParameter("cari");
String query="select i.*,p.periode as per,l.line_name,c.color_name,w.size_items from ink i join periode p on i.periode=p.id join line l on i.line_id=l.line_id join color c on i.color_id=c.color_id join weight w on i.id_weight=w.id_weight where i.detail_id='"+id+"' ";
ResultSet rs=c.GetData(query);
JSONArray js= new JSONArray();
JSONObject json=new JSONObject();
while(rs.next()){
String[] value = {
rs.getString("ink_id"),
rs.getString("detail_id"),
rs.getString("ink_name"),
rs.getString("ink_amountPrice"),
rs.getString("ink_amountVolume"),
rs.getString("per"),
rs.getString("line_name"),
rs.getString("color_name"),
rs.getString("size_items")
};
    String[] key = {
"id",
"detailId",
"name",
"amountPrice",
"amountValue",
"periode",
"line",
"color",
"size"
};
 js.add(new pushData(key, value));
}
StringWriter hasil = new StringWriter();
js.writeJSONString(hasil);
String jsons = hasil.toString();

out.print(jsons);

%>
