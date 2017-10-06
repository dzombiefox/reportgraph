<%@page import="java.io.StringWriter"%>
<%@page import="config.pushData"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="config.connect"%>
<%    
connect c =new connect();
String id=request.getParameter("size");
String query="select * from glaze join motif on glaze.motif_id=motif.motif_id join color on glaze.color_id=color.color_id join weight on glaze.id_weight=weight.id_weight";
ResultSet rs=c.GetData(query);
JSONArray js = new JSONArray();
while(rs.next()){
 String[] value = {
rs.getString("detail_id"),
rs.getString("motif_name"),
rs.getString("color_name"),
rs.getString("size_items"),
};
 String[] key = {
"id",
"name",
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
